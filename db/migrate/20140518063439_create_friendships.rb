class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :friend_id
      t.integer :item_id

      t.timestamps
    end
  end
end
