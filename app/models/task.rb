class Task < ApplicationRecord
  validates :name, presence: true
  belongs_to :group
  belongs_to :state

  after_create do |task|
    ApiCaller.analyze("Task", task.id, task.detail, task.creator_id)
  end
end
