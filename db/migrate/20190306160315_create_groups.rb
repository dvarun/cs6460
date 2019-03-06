class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.boolean :instructor_allowed, default: false

      t.timestamps null: false
    end
  end
end
