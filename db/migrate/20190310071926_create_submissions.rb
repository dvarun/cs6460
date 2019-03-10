class CreateSubmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :submissions do |t|
      t.integer :group_id
      t.integer :course_id
      t.integer :user_id
      t.string :detail

      t.timestamps
    end
  end
end
