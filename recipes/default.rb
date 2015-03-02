#
# Cookbook Name:: acronis
# Recipe:: default
#
# Copyright 2014, Acronis
#
# All rights reserved - Do Not Redistribute
#

node['acronis']['packages'].each do |pckg|
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

include_recipe 'acronis::datetime'
include_recipe 'acronis::motd'
include_recipe 'acronis::user'

if node['acronis']['gitlab']['connect']
    include_recipe 'acronis::gitlab'
end