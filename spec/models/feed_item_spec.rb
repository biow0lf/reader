# encoding: utf-8

require 'spec_helper'

describe FeedItem do
  it { should belong_to :feed }

  it { should validate_presence_of :feed }
  it { should validate_presence_of :title }
  it { should validate_presence_of :body }

  it { should have_db_index :feed_id }
end
