class AddFeedController < ApplicationController
  before_filter :authenticate_user!

  def new
  end

  def create
    Feed.add_feed(params[:url], current_user)
    redirect_to dashboard_path
  end
end
