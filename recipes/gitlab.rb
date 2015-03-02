#
# Cookbook Name:: acronis
# Recipe:: gitlab
#
# Copyright 2015, Acronis
#
# All rights reserved - Do Not Redistribute
#

if node['acronis']['gitlab']['project_id'] != nil
    deploy_key node['acronis']['gitlab']['label'] do
        provider Chef::Provider::DeployKeyGitlab
        path "#{node['acronis']['home_dir']}/.ssh"
        credentials({
            :token => node['acronis']['gitlab']['token']
        })
        api_url "#{node['acronis']['gitlab']['api_scheme']}://#{node['acronis']['gitlab']['api_domain']}"
        repo node['acronis']['gitlab']['project_id']
        owner node['acronis']['user']
        group node['acronis']['group']
        mode 00600
        action :add
    end

    ssh_known_hosts_entry node['acronis']['gitlab']['api_domain'] do
        not_if "a=$(ssh-keyscan -H -t rsa #{node['acronis']['gitlab']['api_domain']} | grep -Po '(AAAA.*)'); grep $a #{node['ssh_known_hosts']['file']}"
    end
end