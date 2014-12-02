# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'workdemo'
set :repo_url, 'git@github.com:houjinan/workdemo.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call
set :rails_env, 'production'
# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :info

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
set :linked_files, %w{config/thin.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5
set :ssh_options, {forward_agent:true}
namespace :deploy do

  desc 'Restart application'
  task :restart do
    invoke :"deploy:stop"
    invoke :"deploy:start"
  end

  task :start do 
    invoke :"rvm:hook"
    on roles :app do
      within current_path do
        unless test("[ -f #{fetch(:thin_pid)} ]")
          info ">>>>>> starting thin"
          execute :bundle, "exec thin start -C #{fetch(:thin_config)}"
        else
          error ">>>>>> thin already started"
        end
      end
    end
  end
  
  task :stop do 
    on roles :app do
      within current_path do
        if test("[ -f #{fetch(:thin_pid)} ]")
          info ">>>>>> stopping thin"
          execute :bundle, "exec thin stop -C #{fetch(:thin_config)}"
        else
          error ">>>>>> can not stop. there is no started thin"
        end
      end
    end
  end

  after :publishing, :restart
end

before "deploy:cleanup_assets", "rvm:hook"
before "deploy:compile_assets", "rvm:hook"
before "bundler:install", "rvm:hook"
after "deploy:publishing", "deploy:restart"