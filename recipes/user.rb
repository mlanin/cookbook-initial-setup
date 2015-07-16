#
# Cookbook Name:: initial_setup
# Recipe:: user
#
# Copyright 2014, initial_setup
#
# All rights reserved - Do Not Redistribute
#

node['initial_setup']['users'].each do |user, info| 

    info['home_dir'] = info['home_dir'] || "/home/#{user}"
    info['shell']    = info['shell']    || node['initial_setup']['default']['shell']
    info['ssh_keys'] = info['ssh_keys'] || node['initial_setup']['default']['ssh_keys']
    info['groups']   = info['groups']   || node['initial_setup']['default']['groups']
    info['sudo']     = info['sudo']     || node['initial_setup']['default']['sudo']{ "group" => false, "commands" => [] }

    if user != "vagrant"
        begin
            site = data_bag_item("initial_setup", node['hostname'])
            password = site[user]["password"] || node['initial_setup']['default']['password']
        rescue
            password = node['initial_setup']['password'] || node['initial_setup']['default']['password']
        end

        user_account user do
            home        info['home_dir']
            shell       info['shell']
            ssh_keys    info['ssh_keys']
        end

        bash "Set password for #{user}" do
            user "root"
            code <<-EOF
                echo "#{user}:#{password}" | chpasswd
            EOF
        end

        if info['sudo']['group']
            bash "Update #{user} user" do
                user "root"
                code <<-EOF
                    usermod -a -G sudo #{user}
                EOF
            end
        end
    end

    if info['groups'].any?
        groups = info['groups'].join(",");

        bash "Update #{user} user" do
            user "root"
            code <<-EOF
                usermod -a -G #{groups} #{user}
            EOF
        end
    end

    if info['sudo']['nopasswd'].any?
        sudo user do
            user      user
            nopasswd  true
            runas     'root'
            commands  info['sudo']['nopasswd']
        end
    end

    bash_profile user do
        home_dir info['home_dir']
    end
    
end

