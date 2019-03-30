class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many :group_members
  has_many :groups, through: :group_members
  has_many :discussions
  has_many :feedbacks
  has_many :visits, class_name: "Ahoy::Visit"
  acts_as_messageable

  def name
    "#{self.first_name + " " + self.last_name}"
  end

  def fname
    "#{self.first_name}"
  end

  def lname
    "#{self.last_name}"
  end

  def mailboxer_email(object)
    nil
  end
end
