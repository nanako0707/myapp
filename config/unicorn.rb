app_path = File.expand_path('../../../', __FILE__)
worker_processes 1
working_directory "/var/www/myapp/current"
listen "/var/www/myapp/shared/tmp/sockets/unicorn.sock"
pid "/var/www/myapp/shared/tmp/pids/unicorn.pid"
stderr_path "/var/www/myapp/shared/log/unicorn.stderr.log"
stdout_path "/var/www/myapp/shared/log/unicorn.stdout.log"