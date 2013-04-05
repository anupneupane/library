class TwitterWorker
  include Sidekiq::Worker

  def perform(current_user_id)
    @twit_worker_auth = TwitterAuth.find_by_user_id(current_user_id)
    @twit_worker_auth.find_and_save_friends
  end
end