require 'serverspec'
require 'net/ssh'

set :backend, :ssh
set :sudo_password, ENV['SUDO_PASSWORD']

host = ENV['TARGET_HOST']

options = Net::SSH::Config.for(host)

options[:user] ||= Etc.getlogin

set :host,        options[:host_name] || host
set :ssh_options, options
