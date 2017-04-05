class Project < ApplicationRecord
  belongs_to :portfolio

  mount_uploader :featured_image, ImageUploader

  validates :position, :name, presence: true
  validates :name, length: { minimum: 6 }
end
