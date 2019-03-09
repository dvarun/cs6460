class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :detail
      t.integer :state_id
      t.integer :assigned_id
      t.integer :creator_id
      t.integer :group_id
      t.timestamps
    end
  end
end
