# encoding: utf-8

require 'spec_helper'

describe User do
  it { should have_and_belong_to_many :feeds }
end
