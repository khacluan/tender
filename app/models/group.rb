class Group < ActiveRecord::Base
  attr_accessible :description, :name, :priority
  has_many :items, dependent: :destroy
end
