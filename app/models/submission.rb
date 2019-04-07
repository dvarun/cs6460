class Submission < ApplicationRecord
  has_one_attached :project
  belongs_to :course
  belongs_to :group
end
