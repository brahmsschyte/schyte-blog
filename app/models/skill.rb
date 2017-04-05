class Skill < ApplicationRecord
  belongs_to :portfolio

  validates :position, :name, :mastery, presence: true
  validates :name, length: { minimum: 6 }
end
