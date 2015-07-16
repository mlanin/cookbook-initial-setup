name             'initial_setup'
maintainer       'initial_setup'
maintainer_email 'maxim.lanin@initial_setup.com'
license          'All rights reserved'
description      'Preconfigures initial_setup servers'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'

depends 'user'
depends 'sudo'
depends 'ssh_known_hosts'