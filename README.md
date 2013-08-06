Description
===========
Installs and configures Redis.

Requirements
============

Attributes
==========
These are general settings used in recipes and templates. Default values are noted.

* `node['redis']['instance']` -  Port number; may also be used as suffix for side-by-side installs. Default is 6379.
* `node['redis']['version']`  -  Either 'stable' (default) or specific version.  E.g. 2.4.16
* `node['redis']['local']`    -  Set to "true" (default) to only bind to 127.0.0.1.  Set to "false" to bind to all ip's.
* `node['redis']['start']`    -  Set to "true" (default) to start the service after install.
* `node['redis']['vm_overcommit_memory']` -  Set to "true" (default) to have section added to "/etc/sysctl.conf" (See APPS-1036)

Usage
=====



