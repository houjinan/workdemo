set :stage, :local
set :server_name, "local.dev"

set :branch, "master"

set :log_level, :debug
set :deploy_to, "/home/houjn/site/workdemo"

set :thin_config, "#{shared_path}/config/thin.yml"
set :thin_pid, "#{shared_path}/tmp/pids/thin.3000.pid"



#set :password, ask('Server password', nil)
#server fetch(:server_name), user: 'soar', port: 22, password: fetch(:password), roles: %w{web app db}

server fetch(:server_name), user: "houjn", roles: %w{web app db}