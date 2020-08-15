server '54.150.100.40', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/kannanako/.ssh/id_rsa'
