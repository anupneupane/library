class TwitterSetupWorker
  include Sidekiq::Worker

  def perform(user_id, auth)
    if @user = User.find(user_id)
      @user.link_twitter(auth)
    end
  end
end