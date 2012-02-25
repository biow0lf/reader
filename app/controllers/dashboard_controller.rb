class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    @feeds = current_user.feeds.includes(:feed_items)
  end
end
