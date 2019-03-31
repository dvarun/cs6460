class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :tones, :model_name, :object_type_name
  end
end
