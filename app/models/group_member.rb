class GroupMember < ApplicationRecord
  has_many :users
  belongs_to :group
end
