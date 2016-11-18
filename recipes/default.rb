#
# Cookbook Name:: ms_testing
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
registry_key 'HKLM\Software' do
    values [{
        :name => "ChefTest",
        :type => :string,
        :data => 'This is a test.'
    }]
    action :create
end

wmf5 = Chef::Config[:file_cache_path] + '/Win8.1AndW2K12R2-KB3134758-x64.msu'

remote_file wmf5 do
  source 'https://s3.amazonaws.com/lupos/Win8.1AndW2K12R2-KB3134758-x64.msu'
end

# windows_package 'Windows Management Framework 5.0' do
#  action :install
#  source wmf5
#  installer_type :msu
#  options 'quiet'
# end
package 'wmf5' do
  action :install
  source wmf5
end
