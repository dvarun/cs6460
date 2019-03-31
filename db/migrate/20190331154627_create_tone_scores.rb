class CreateToneScores < ActiveRecord::Migration[5.2]
  def change
    create_table :tone_scores do |t|
      t.integer :tone_id
      t.string :name
      t.float :score
      t.timestamps
    end
  end
end
