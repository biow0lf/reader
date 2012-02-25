class FeedsUsers < ActiveRecord::Migration
  def up
    create_table :feeds_users, :id => false do |t|
      t.column :feed_id, :integer
      t.column :user_id, :integer
    end
    add_index :feeds_users, [:feed_id, :user_id], :unique => true
  end

  def down
    remove_index :feeds_users
    drop_table :feeds_users
  end
end
