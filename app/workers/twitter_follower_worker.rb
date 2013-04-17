class TwitterFollowerWorker
  include Sidekiq::Worker

  def perform(user_id)
    if @twit_worker_auth = TwitterAuth.find_by_user_id(user_id)
      @twit_worker_auth.find_and_save_followers
    end
  end
end