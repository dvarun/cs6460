class Group < ApplicationRecord
  belongs_to :course
  has_many :users, through: :group_members
end
