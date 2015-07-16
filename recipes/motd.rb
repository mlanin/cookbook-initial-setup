#
# Cookbook Name:: debian_setup
# Recipe:: motd
#
# Copyright 2014, debian_setup
#
# All rights reserved - Do Not Redistribute
#

directory "/etc/update-motd.d" do
    mode 0755
    action :create
end

cookbook_file "/etc/update-motd.d/00-header" do
    source "00-header"
    mode "0755"
end
cookbook_file "/etc/update-motd.d/10-sysinfo" do
    source "10-sysinfo"
    mode "0755"
end
cookbook_file "/etc/update-motd.d/99-footer" do
    source "99-footer"
    mode "0755"
end

if !File.symlink?('/etc/motd')
    file "/etc/motd" do
        action :delete
    end

    link "/etc/motd" do
        to "/var/run/motd"
    end
end