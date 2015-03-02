#
# Cookbook Name:: acronis
# Recipe:: datetime
#
# Copyright 2014, Acronis
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
  content node["acronis"]["timezone"]
  notifies :run, "execute[update-tzdata]"
end

package "tzdata" do
  action :install
end