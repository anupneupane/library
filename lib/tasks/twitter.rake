namespace :twitter do
  desc "Delete all unauthenticated users"
  task :prune => :environment do
    TwitterAuth.delete_all_unauthenticated
  end

  desc "Update all friendships"
  task :update => :environment do
    TwitterAuth.update_all_friendships
  end
end