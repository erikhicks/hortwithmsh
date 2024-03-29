# See http://unicorn.bogomips.org/Unicorn/Configurator.html for complete
# documentation.
worker_processes 2
# Help ensure your application will always spawn in the symlinked
# "current" directory that Capistrano sets up.
working_directory "/home/erikhicks/hortwithmsh/current"
# listen on both a Unix domain socket and a TCP port,
# we use a shorter backlog for quicker failover when busy
listen "/tmp/hortwithmsh.socket", :backlog => 64
# nuke workers after 30 seconds instead of 60 seconds (the default)
timeout 30
# feel free to point this anywhere accessible on the filesystem
user 'erikhicks', 'staff'
shared_path = "/home/erikhicks/hortwithmsh/shared"
pid "#{shared_path}/pids/unicorn.pid"
stderr_path "#{shared_path}/log/unicorn.stderr.log"
stdout_path "#{shared_path}/log/unicorn.stdout.log"