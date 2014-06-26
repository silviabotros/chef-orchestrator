#
# Cookbook Name:: chef-orchestrator
# Recipe:: default
#
# Copyright (C) 2014 
#
# All rights reserved - Do Not Redistribute
#
include_recipe "orchestrator::_database_setup"
case node['platform']
  when "debian", "ubuntu"
    execute "install from .deb" do
      command "sudo dpkg -i https://github.com/outbrain/orchestrator/releases/download/v1.0/orchestrator_1.0_amd64.deb"
    end
  when "redhat", "centos", "fedora" 
    execute "install from rpm" do
      command "sudo rpm -i https://github.com/outbrain/orchestrator/releases/download/v1.0/orchestrator-1.0-1.x86_64.rpm"
    end
end

execute "start orchestrator" do
  command "cd /usr/local/orchestrator && ./orchestrator http > /var/log/orchestrator.log 2>&1"
end


