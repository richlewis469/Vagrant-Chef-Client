#
# Cookbook Name:: main
# Recipe:: default
#
# Copyright (C) 2017 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'yum::default'
# include_recipe 'wget::default'
include_recipe 'git::default'
include_recipe 'curl::default'
include_recipe 'screen::default'
include_recipe 'sshd::default'
include_recipe 'ntp::default'
include_recipe 'openssl::default'
include_recipe 'iptables::default'
include_recipe 'firewalld::default'
include_recipe 'chef-client::default'
