# encoding: utf-8

require 'spec_helper'

describe Feed do
  it { should have_many :feed_items }
  it { should have_and_belong_to_many :users }

  it { should validate_presence_of :url }
  it { should validate_presence_of :link }
  it { should validate_presence_of :title }
end
