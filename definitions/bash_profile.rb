#
# Cookbook Name:: acronis
# Definition: bash_profile
#
# Copyright 2014, Acronis
#
# All rights reserved - Do Not Redistribute
#

define :bash_profile, :username => nil, :groupname => nil, :home_dir => '/root' do
    username  = params[:username]  || params[:name];
    groupname = params[:groupname] || params[:name];
    
    cookbook_file "#{params[:home_dir]}/.bash_profile" do
        source "bash_profile"
        owner username
        group groupname
        mode "0644"
    end

    cookbook_file "#{params[:home_dir]}/z.sh" do
        source "z.sh"
        owner username
        group groupname
        mode "0644"
    end

    cookbook_file "#{params[:home_dir]}/.nanorc" do
        source "nanorc"
        owner username
        group groupname
        mode "0644"
    end

    cookbook_file "#{params[:home_dir]}/.inputrc" do
        source "inputrc"
        owner username
        group groupname
        mode "0644"
    end

    directory "#{params[:home_dir]}/.ssh" do
        owner username
        group groupname
        mode "0700"
    end

    template "#{params[:home_dir]}/.ssh/wrap-ssh4git.sh" do
        source 'wrap-ssh4git.sh.erb'
        owner username
        group groupname
        mode 00700
        variables(
            :home_dir => params[:home_dir]
        )
    end
end