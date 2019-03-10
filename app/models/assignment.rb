class Assignment < ApplicationRecord
  belongs_to :course
  has_one_attached :document
end
