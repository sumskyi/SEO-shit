set :application, "twitter_topics"
set :repository,  "git://github.com/sumskyi/SEO-shit.git"

set :deploy_to, "/var/www/#{application}"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "173.203.238.163"                          # Your HTTP server, Apache/etc
role :app, "173.203.238.163"                          # This may be the same as your `Web` server
role :db,  "173.203.238.163", :primary => true # This is where Rails migrations will run

set :user, 'root'

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  task :symlink_db do
    run "ln -nfs #{shared_path}/db/twitter_topics.db #{release_path}/db/twitter_topics.db"
  end
end

after 'deploy:symlink', 'deploy:symlink_db'
