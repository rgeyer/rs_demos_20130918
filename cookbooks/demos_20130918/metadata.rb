name             'demos_20130918'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures demos_20130918'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "rightscale"

recipe "demos_20130918::default","Just logs a message"
recipe "demos_20130918::boot","Just logs a message"
recipe "demos_20130918::operational","Just logs a message"
recipe "demos_20130918::decommission","Just logs a message"
