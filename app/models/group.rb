class Group < ApplicationRecord
  belongs_to :course
  has_many :group_members
end
