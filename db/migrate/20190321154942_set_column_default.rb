class SetColumnDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :is_instructor, false
  end
end
