#
# Cookbook Name:: initial_setup
# Recipe:: default
#
# Copyright 2014, initial_setup
#
# All rights reserved - Do Not Redistribute
#

node['initial_setup']['packages'].each do | pckg |
    package pckg
end

cookbook_file "/usr/share/nano/nginx.nanorc" do
    source "nginx.nanorc"
    owner 'root'
    mode "0644"
end

bash_profile 'root' do
    home_dir '/root'
end

directory "/var/www" do
    mode 0755
    action :create
end

include_recipe 'initial_setup::datetime'
include_recipe 'initial_setup::motd'
include_recipe 'initial_setup::user'

node['initial_setup']['ssh_known_hosts'].each do | known_host |
	ssh_known_hosts_entry known_host do
	    not_if "a=$(ssh-keyscan -H -t rsa #{known_host} | grep -Po '(AAAA.*)'); grep $a #{node['ssh_known_hosts']['file']}"
	end
end