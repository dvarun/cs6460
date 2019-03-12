class Group < ApplicationRecord
  belongs_to :course
  has_many :group_members
  has_many :tasks
end
