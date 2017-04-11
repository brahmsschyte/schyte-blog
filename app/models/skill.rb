class Skill < ApplicationRecord
  belongs_to :portfolio

  validates :position, :name, :mastery, presence: true
  validates :position, uniqueness: true, numericality: true
  validates :mastery, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to:100 }
  validates :name, length: { minimum: 6 }
end
