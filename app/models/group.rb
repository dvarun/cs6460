class Group < ApplicationRecord
  validates :name, presence: true
  belongs_to :course
  has_many :group_members
  has_many :tasks
  has_many :discussions
end
