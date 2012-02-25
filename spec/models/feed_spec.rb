# encoding: utf-8

require 'spec_helper'

describe Feed do
  it { should have_many :feed_items }

  it { should validate_presence_of :url }
end
