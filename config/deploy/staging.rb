set :stage, :staging
server '108.136.158.162', user: 'ubuntu', roles: %w{app web db}
set :deploy_to, '/home/ubuntu/marketplace_backend'
set :branch, "staging"
