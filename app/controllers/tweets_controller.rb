class TweetsController < ApplicationController
  def index
  	if params[:lat]
  		@tweets = UserTweet.where(:latitude => params[:lat] , :logitude => params[:log]).paginate(:page => params[:page], :per_page => 10)
  	else
  		@tweets = UserTweet.paginate(:page => params[:page], :per_page => 10)
  	end
  end

  def show
  	@tweet = UserTweet.find(params[:id])
  end
end
