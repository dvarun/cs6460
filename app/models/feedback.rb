class Feedback < ApplicationRecord
  validates :detail, presence: true
  belongs_to :user
  belongs_to :task
end
