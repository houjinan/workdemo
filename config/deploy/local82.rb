set :stage, :local
set :server_name, "192.168.1.82"

set :branch, "master"

set :log_level, :debug
set :deploy_to, "/home/deploy/site/workdemo"

set :thin_port, 3000
set :thin_config, "#{shared_path}/config/thin.yml"
set :thin_pid, "#{shared_path}/tmp/pids/thin.#{fetch(:thin_port)}.pid"



#set :password, ask('Server password', nil)
#server fetch(:server_name), user: 'soar', port: 22, password: fetch(:password), roles: %w{web app db}

server fetch(:server_name), user: "deploy", roles: %w{web app db}