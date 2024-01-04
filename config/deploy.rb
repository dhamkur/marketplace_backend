# config valid for current version and patch releases of Capistrano
lock "~> 3.18.0"

set :application, "marketplace_backend"
set :repo_url, "git@github.com:dhamkur/marketplace_backend.git"
set :deploy_to, "/home/ubuntu/marketplace_backend"
set :rbenv_type, :user
set :rbenv_ruby, '3.1.2'
set :user, 'ubuntu'
set :puma_user, 'ubuntu'
set :puma_threads, [5, 5]
set :puma_workers, 3
set :pty, true
set :use_sudo, false
set :deploy_via, :remote_cache
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{shared_path}/log/puma.error.log"
set :puma_error_log, "#{shared_path}/log/puma.access.log"
set :ssh_options, { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true
set :linked_files, %w{ config/database.yml .env.staging config/secrets.yml }
set :linked_dirs, %w{ log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system }
