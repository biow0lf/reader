# encoding: utf-8

class Feed < ActiveRecord::Base
  has_many :feed_items

  # url of rss feed
  validates :url, presence: true
  # rss.channel.link
  validates :link, presence: true
  # rss.channel.title
  validates :title, presence: true
end
