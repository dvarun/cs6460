class Tone < ApplicationRecord
  has_many :tone_scores
  belongs_to :user
end
