name             'debian_setup'
maintainer       'debian_setup'
maintainer_email 'maxim.lanin@debian_setup.com'
license          'All rights reserved'
description      'Preconfigures debian_setup servers'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'

depends 'user'
depends 'sudo'
depends 'deploy_key'
depends 'ssh_known_hosts'