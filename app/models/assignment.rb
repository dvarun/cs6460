class Assignment < ApplicationRecord
  belongs_to :course
  has_one_attached :document

  acts_as_commontable dependent: :destroy
end
