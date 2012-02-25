class AddIndexToFeedItemsOnFeedId < ActiveRecord::Migration
  def change
    add_index :feed_items, :feed_id
  end
end
