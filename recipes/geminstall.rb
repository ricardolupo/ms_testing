#
# Cookbook Name:: win2012r2
# Recipe:: geminstall
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
vault_gem = Chef::Config[:file_cache_path] + '\chef-vault-2.6.1.gem'

cookbook_file vault_gem do
  source 'chef-vault-2.6.1.gem'
end


chef_gem 'chef-vault' do
  action :install
  source vault_gem
  compile_time false
end
