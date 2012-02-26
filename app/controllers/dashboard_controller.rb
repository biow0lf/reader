class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    # @feeds = current_user.feeds.includes(:feed_items).page(params[:page]).per(10)
    feeds_ids = current_user.feeds.map { |i| i.id }
    @feed_items = FeedItem.where(feed_id: feeds_ids).page(params[:page]).per(10)
  end
end
