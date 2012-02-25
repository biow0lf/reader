# encoding: utf-8

class Feed < ActiveRecord::Base
  has_many :feed_items

  validates :url, presence: true
end
