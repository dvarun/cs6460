class Task < ApplicationRecord
  belongs_to :group
  belongs_to :state
end