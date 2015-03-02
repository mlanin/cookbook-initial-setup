#
# Cookbook Name:: acronis
# Recipe:: user
#
# Copyright 2014, Acronis
#
# All rights reserved - Do Not Redistribute
#

if node.chef_environment != "Vagrant"
    begin
        site = data_bag_item("acronis", node['hostname'])
        password = site["password"]
    rescue
        password = node['acronis']['password']
    end

    user_account node['acronis']['user'] do
        home        node['acronis']['home_dir']
        shell       node['acronis']['shell']
        ssh_keys    node['acronis']['ssh_keys']
    end

    bash "Set password for #{node['acronis']['user']}" do
        user "root"
        code <<-EOF
            echo "#{node['acronis']['user']}:#{password}" | chpasswd
        EOF
    end
end

bash "Update #{node['acronis']['user']} user" do
    user "root"
    code <<-EOF
        usermod -a -G staff,sudo #{node['acronis']['user']}
    EOF
end

bash_profile node['acronis']['user'] do
    home_dir node['acronis']['home_dir']
end

sudo node['acronis']['user'] do
    user      node['acronis']['user']
    nopasswd  true
    runas     'root'
    commands  node['acronis']['sudo_commands']
end