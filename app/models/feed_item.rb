# encoding: utf-8

class FeedItem < ActiveRecord::Base
  include Likeable

  belongs_to :feed

  validates :feed, presence: true
  validates :title, presence: true
  validates :link, presence: true
  validates :body, presence: true
end
