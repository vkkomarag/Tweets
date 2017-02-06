class TweetsController < ApplicationController
  def index
  	@tweets = Storing.paginate(:page => params[:page], :per_page => 10)
  end

  def show
  	@tweet = Storing.find(params[:id])
  end
end
