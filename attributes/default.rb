default['acronis']['packages'] = ["sshpass", "bash-completion", "unattended-upgrades", "htop"]

default['acronis']['user'] = "acronis"
default['acronis']['group'] = node['acronis']['user']
default['acronis']['password'] = "Qwerty!@"
default['acronis']['home_dir'] = "/home/#{node['acronis']['user']}"
default['acronis']['shell'] = "/bin/bash"

default['acronis']['timezone'] = "Etc/GMT"
default['acronis']['ssh_keys'] = []
default['acronis']['sudo_commands'] = ["CHEF_CLIENT"] # default aliases CHEF_CLIENT, NGINX_RELOAD, NGINX_CLEAR_CACHE, MEMCACHED_RESTART

default['acronis']['gitlab']['connect'] = false
default['acronis']['gitlab']['api_scheme'] = 'http'
default['acronis']['gitlab']['api_domain'] = ''
default['acronis']['gitlab']['project_id'] = nil
default['acronis']['gitlab']['label'] = 'id_rsa'
default['acronis']['gitlab']['token'] = ''