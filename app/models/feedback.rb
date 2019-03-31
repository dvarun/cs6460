class Feedback < ApplicationRecord
  include ApiCaller
  validates :detail, presence: true
  belongs_to :user
  belongs_to :task

  after_create do |feedback|
    ApiCaller.analyze("Feedback", feedback.id, feedback.detail, feedback.user_id)
  end
end
