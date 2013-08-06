#
# Cookbook Name:: redis
# Recipe:: default
#
# Copyright 2012, Visible Measures
#
# Install the redis package
package "redis"

sysctl = "/etc/sysctl.conf"
vm_overcommit_found = ((File.read("#{sysctl}")) =~ /vm\.overcommit_memory/) != nil
sysctl_text = '\n#Mod for redis\n#turn on memory over-commit\nvm.overcommit_memory=1\n'

execute "uncomment-vm-overcommit" do
  command     "sed -i 's/.*vm\.overcommit_memory.*/vm.overcommit_memory=1/g' #{sysctl} && sysctl vm.overcommit_memory=1"
  only_if     { node[:redis][:vm_overcommit_memory] && vm_overcommit_found }
end

execute "append-vm-overcommit" do
  command     "printf \"%b\" \"#{sysctl_text}\" >> #{sysctl} && sysctl vm.overcommit_memory=1"
  only_if      { node[:redis][:vm_overcommit_memory] && !vm_overcommit_found }
end

template "/home/redis/conf/redis.conf" do
  source    "redis.conf.erb"
  owner     "redis"
  group     "redis"
  mode      "0755"
end

service "redis" do
  supports :status => true, :start => true, :restart => true, :reload => true
  action :start
end
