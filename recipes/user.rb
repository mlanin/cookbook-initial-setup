#
# Cookbook Name:: debian_setup
# Recipe:: user
#
# Copyright 2014, debian_setup
#
# All rights reserved - Do Not Redistribute
#

node['debian_setup']['users'].each do |user, info| 

    info['home_dir'] = info['home_dir'] || "/home/#{user}"
    info['shell']    = info['shell'] || node['debian_setup']['default']['shell']
    info['ssh_keys'] = info['ssh_keys'] || node['debian_setup']['default']['ssh_keys']
    info['groups']   = info['groups'] || node['debian_setup']['default']['groups']
    info['sudo']     = info['sudo'] || node['debian_setup']['default']['sudo']{ "group" => false, "commands" => [] }

    if user != "vagrant"
        begin
            site = data_bag_item("debian_setup", node['hostname'])
            password = site[user]["password"] || node['debian_setup']['default']['password']
        rescue
            password = node['debian_setup']['password'] || node['debian_setup']['default']['password']
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

