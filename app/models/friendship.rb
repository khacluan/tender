class Friendship < ActiveRecord::Base
  attr_accessible :friend_id, :item_id
  belongs_to :item
  belongs_to :friend, class_name: 'Item'
end
