maintainer       "Visible Measures"
maintainer_email "ops@visiblemeasures.com"
license          "Apache v2.0"
description      "Installs/Configures redis"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version "1.0.0"

depends					 "vmc-access"
depends					 "vmc-yum"

supports 'centos'
supports 'amazon'