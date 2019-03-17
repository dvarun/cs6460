class Task < ApplicationRecord
  validates :name, presence: true
  belongs_to :group
  belongs_to :state
end
