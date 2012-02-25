# encoding: utf-8

require 'open-uri'
require 'htmlentities'

class Feed < ActiveRecord::Base
  has_many :feed_items
  has_and_belongs_to_many :users

  # url of rss feed
  validates :url, presence: true
  # rss.channel.link
  validates :link, presence: true, unless: "new_record?"
  # rss.channel.title
  validates :title, presence: true, unless: "new_record?"

  def self.add_feed(url, user)
    unless Feed.feed_exists?(url)
      feed = Feed.create(url: url)
      feed.delay.update_link_and_title
    end
    user.feeds << Feed.where(url: url).first
  end

  def self.feed_exists?(url)
    if Feed.where(url: url).first
      true
    else
      false
    end
  end

  def update_link_and_title
    rss = SimpleRSS.parse(open(url))
    self.link = rss.channel.link
    self.title = rss.channel.title
    self.save!
    self.delay.update_feed_items
  end

  def update_feed_items
    rss = SimpleRSS.parse(open(url))
    rss.items.each do |item|
      FeedItem.create!(feed_id: self.id,
                       title: item.title,
                       link: item.link,
                       #author: item.author,
                       body: HTMLEntities.new.decode(item.description))
                       #date: item.pubDate,
                       #guid: item.guid,
                       #feedburner_origLink)
    end
  end
end
