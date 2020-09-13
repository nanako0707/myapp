server 'https://opereminder.com', user: 'myuser', roles: %w{app db web}
set :ssh_options, keys: ENV['SECRET_SSH_KEY']