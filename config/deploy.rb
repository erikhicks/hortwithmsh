require 'bundler/capistrano'
require 'rvm/capistrano'

set :rvm_ruby_string, 'ruby-1.9.2-p290'
set :rvm_type, :root

ssh_options[:paranoid]    = false
default_run_options[:pty] = true

set :use_sudo, false
set :user, "erikhicks"
set :password, "rooter"
set :runner, "erikhicks"

set :default_environment, {
  'PATH' => "/usr/local/rvm/gems/ruby-1.9.2-p290/bin:/usr/local/rvm/gems/ruby-1.9.2-p290/bin:/usr/local/rvm/rubies/ruby-1.9.2-p290/bin:/usr/local/rvm/bin:$PATH",
  'RUBY_VERSION' => 'ruby-1.9.2-p290',
  'GEM_HOME' => '/usr/local/rvm/gems/ruby-1.9.2-p290',
  'GEM_PATH' => '/usr/local/rvm/gems/ruby-1.9.2-p290:/usr/local/rvm/gems/ruby-1.9.2-p290'
}

set :application, "hortwithmsh"
set :repository,  "git@codeplane.com:ehicks/hortwithmsh.git"
set :scm, :git # Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :branch, 'master'
set :git_shallow_clone, 1
set :deploy_via, :remote_cache
set :copy_compression, :bz2
set :rails_env, 'production'
set :deploy_to, "/home/erikhicks/#{application}"
set :db_name, "hortwithmsh"
set :db_user, 'root'
set :db_pass, 'rooter'

role :web, "erikhicks.com"                          # Your HTTP server, Apache/etc
role :app, "erikhicks.com"                          # This may be the same as your `Web` server
role :db,  "erikhicks.com", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

task :import_plants do
  rake = fetch(:rake, 'rake')
  rails_env = fetch(:rails_env, 'production')

  run "cd '#{current_path}' && #{rake} import:mobile_plants RAILS_ENV=#{rails_env} --trace"
end

namespace :deploy do
  task :start do
    sudo "/etc/init.d/unicorn_hortwithmsh start"
  end
  task :stop do
    sudo "/etc/init.d/unicorn_hortwithmsh stop"
  end
  task :restart do
    sudo "/etc/init.d/unicorn_hortwithmsh reload"
  end
  task :precompile, :role => :app do  
    run "cd #{release_path}/ && bundle exec rake assets:precompile"  
  end
  task :material_symlink, :role => :app do
    print "#{release_path}/public/materials"
    run "rm -rf #{release_path}/public/materials"
    run "ln -nfs #{shared_path}/materials #{release_path}/public/materials"
  end
end

namespace :init do
  desc "create database"
  task :create_database do
    #create the database on setup
    run rake_task("db:create")
  end
end  

after "deploy:finalize_update", "deploy:precompile", "deploy:material_symlink"