class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.integer :user_id
      t.integer :task_id
      t.string :detail

      t.timestamps
    end
  end
end
