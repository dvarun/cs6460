class CreateTones < ActiveRecord::Migration[5.2]
  def change
    create_table :tones do |t|
      t.integer :model_id
      t.string :model_name
      t.integer :user_id
      t.timestamps
    end
  end
end
