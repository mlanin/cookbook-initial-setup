name             'initial_setup'
maintainer       'Maxim Lanin'
maintainer_email 'max@lanin.me'
license          'All rights reserved'
description      'Preconfigures debian/ubuntu servers'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'

depends 'user'
depends 'sudo'
depends 'ssh_known_hosts'
