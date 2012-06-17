root = "/home/deployer/apps/thin_analytics/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.thin_analytics.sock"
worker_processes 2
timeout 30
