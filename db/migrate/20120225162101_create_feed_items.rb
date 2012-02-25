class CreateFeedItems < ActiveRecord::Migration
  def change
    create_table :feed_items do |t|
      t.integer :feed_id
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
