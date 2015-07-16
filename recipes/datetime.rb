#
# Cookbook Name:: debian_setup
# Recipe:: datetime
#
# Copyright 2014, debian_setup
#
# All rights reserved - Do Not Redistribute
#

%w(ntp ntpdate).each do |ntppkg|
    package ntppkg
end

service 'ntp' do
    supports :status => true, :restart => true
    action   [:enable, :start]
end

execute "update-tzdata" do
  command "dpkg-reconfigure -f noninteractive tzdata"
  action :nothing
end

file "/etc/timezone" do
  owner "root"
  group "root"
  mode "00644"
  content node["debian_setup"]["timezone"]
  notifies :run, "execute[update-tzdata]"
end

package "tzdata" do
  action :install
end