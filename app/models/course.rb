class Course < ApplicationRecord
  has_many :groups
  has_one :assignment
end
