class RetweetsController < ApplicationController

  before_action :set_tweet, only: [:show, :edit,:update,:destroy, :complete]
  
  def new
    @retweet= Retweet.new
  end
  
  def create
    retweet =Reweet.find_by(id:params[:format])
    if Retweet.find_by(user_id:current_user.id,tweet_id:tweet.id )
      @destruir= Retweet.find_by(user_id:current_user.id,retweet_id:retweet.id)
      @destruir.destroy
      retweet.likes_count-=1
      retweet.save
      redirect_to root_path
    else
      Retweet.create(user_id:current_user.id, retweet_id:retweet.id)
      retweet.likes_count+=1
      retweet.save
      redirect_to root_path
    end
  end

  def destroy
  end

private

  def retweet_params
    params.require(:retweet).permit(:user_id,:retweet_id)
  end
  
  def set_retweet
    @retweet = Retweet.find(params[:id])
  end

end
