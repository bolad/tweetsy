class TweetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet, only: %i[show edit update destroy]

  def index
    @tweets = Tweet.all
  end

  def show
  end

  def new
    @pack = Pack.find(params[:pack_id])
    @tweet = Tweet.new
  end

  def edit
  end

  def create
    @pack = Pack.find(params[:pack_id])
    @tweet = @pack.tweets.build(tweet_params)

    if @tweet.save
      redirect_to packs_path, notice: 'Tweet was successfully created.'

    else
      render :new
    end
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to @tweet, notice: 'Tweet was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_url, notice: 'Tweet was successfully destroyed.'
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:message, :pack_id)
  end
end
