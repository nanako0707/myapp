lock "3.6.0"
set :application, "myapp"
set :repo_url, "https://github.com/nanakobaby/myapp"
set :deploy_to, "/var/www/myapp"
set :rbenv_type, :system
set :rbenv_ruby, File.read('.ruby-version').strip
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} #{fetch(:rbenv_path)}/bin/rbenv exec"
append :linked_dirs, '.bundle'
set :bundle_jobs, 4
append :linked_files, "config/master.key"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets"