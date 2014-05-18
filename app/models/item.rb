class Item < ActiveRecord::Base
  attr_accessible :description, :name, :group_id, :photo, :friends, :friend_ids
  
  belongs_to :group

  has_many :friendships
  has_many :friends, through: :friendships

  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :item

  accepts_nested_attributes_for :friendships

	has_attached_file :photo, :styles => {:thumb => "50x50#" }, :default_url => "/assets/not_available.jpg"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  

  def friends=(ids)
    self.friend_ids = ids.split(",")
  end 

	def as_json(options = {})
		{
			id: id,
			name: name
		}
	end


end
