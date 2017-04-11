class Project < ApplicationRecord
  belongs_to :portfolio

  mount_uploader :featured_image, ImageUploader

  validates :position, :name, :timeline, :info, presence: true
  validates :position, uniqueness: true, numericality: true
  validates :name, length: { minimum: 6 }
  validates :timeline, length: { minimum: 4 }
  validates :info, length: { minimum: 40 }
end
