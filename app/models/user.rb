class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :group_members
  has_many :groups, through: :group_members

  acts_as_commontator
end
