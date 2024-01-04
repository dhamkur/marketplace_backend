set :stage, :staging
server '204.236.211.113', user: 'ubuntu', roles: %w{app web db}
set :deploy_to, '/home/ubuntu/marketplace_backend'
set :branch, "staging"
