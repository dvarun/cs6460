class Group < ApplicationRecord
  validates :name, presence: true
  belongs_to :course
  has_many :group_members
  has_many :tasks
  has_many :discussions

  def progress
    progress_percent = 0
    todo_task = Task.where("group_id = ? and state_id = ?", self.id, 1)
    in_progress_task = Task.where("group_id = ? and state_id = ?", self.id, 2)
    done_task = Task.where("group_id = ? and state_id = ?", self.id, 3)
    total_task = Task.where("group_id = ?", self.id)

    if total_task.blank?
      progress_percent = 0
    else
      progress_percent = (1 - ((in_progress_task.count.to_f + todo_task.count.to_f) / total_task.count.to_f)) * 100
    end
    return progress_percent.to_i
  end
end
