namespace :check do
  desc "Make sure local git is in sync with remote."
  task :revision, roles: :app do
    unless `git rev-parse HEAD` == `git rev-parse origin/master`
      puts 'WARNING: HEAD is not the same as origin/master'
      puts "Run `git push` to sync changes."
      exit
    end
  end
  before "deploy", "check:revision"
  before "deploy:migrations", "check:revision"
  before "deploy:cold", "check:revision"
end

