class TweetsWorker
  include Sidekiq::Worker

  sidekiq_options queue: 'high', retry: 3

  def perform
    # $twitter_client.update(current_user.packs.tweets.first.message)
    puts "hello from sidekid JOB"
  end
end
