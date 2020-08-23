lock '3.6.0'
set :application, 'myapp'
set :deploy_to, '/var/www/myapp'
set :repo_url,  'https://github.com/nanakobaby/myapp'
set :linked_files, fetch(:linked_files, []).push("config/master.key")
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')
set :rbenv_type, :user
set :rbenv_ruby, '2.6.5'
set :ssh_options, auth_methods: ['publickey'],
                  keys: ['~/.ssh/myapp-key.pem'] 
set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5
after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end