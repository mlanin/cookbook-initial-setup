#
# Cookbook Name:: debian_setup
# Recipe:: default
#
# Copyright 2014, debian_setup
#
# All rights reserved - Do Not Redistribute
#

node['debian_setup']['packages'].each do |pckg|
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

include_recipe 'debian_setup::datetime'
include_recipe 'debian_setup::motd'
include_recipe 'debian_setup::user'