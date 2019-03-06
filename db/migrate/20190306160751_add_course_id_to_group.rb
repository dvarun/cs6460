class AddCourseIdToGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :course_id, :integer
  end
end
