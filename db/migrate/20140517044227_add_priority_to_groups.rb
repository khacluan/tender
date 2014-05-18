class AddPriorityToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :priority, :integer, default: 0
  end
end
