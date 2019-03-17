class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many :group_members
  has_many :groups, through: :group_members
  has_many :discussions
  has_many :feedbacks
end
