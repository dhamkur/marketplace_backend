set :stage, :production
server 'xxx.xxx.xx.xx', user: 'ubuntu', roles: %w{app web db}
set :deploy_to, '/home/ubuntu/marketplace_backend'
set :branch, "main"
