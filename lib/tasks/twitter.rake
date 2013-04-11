namespace :twitter do

  desc "Delete unauthenticated users and update all friendships"
  task :update_all => :environment do
    Rake::Task['twitter:prune'].invoke
    Rake::Task['twitter:update'].invoke
  end

  desc "Delete all unauthenticated users"
  task :prune => :environment do
    TwitterAuth.delete_all_unauthenticated
  end

  desc "Update all friendships"
  task :update => :environment do
    TwitterAuth.update_all_friendships
  end
end