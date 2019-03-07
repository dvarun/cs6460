class AddColumninGmember < ActiveRecord::Migration[5.2]
  def change
    add_column :group_members, :user_id, :integer
    add_column :group_members, :group_id, :integer
  end
end
