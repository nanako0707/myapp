server '54.238.255.197', user: 'myuser', roles: %w{app db web}
set :ssh_options, keys: '/Users/kannanako/.ssh/myapp-key.pem'
