name             'acronis'
maintainer       'Acronis'
maintainer_email 'maxim.lanin@acronis.com'
license          'All rights reserved'
description      'Preconfigures Acronis servers'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'

depends 'user'
depends 'sudo'
depends 'deploy_key'
depends 'ssh_known_hosts'