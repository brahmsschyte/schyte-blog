class Project < ApplicationRecord
  belongs_to :portfolio

  mount_uploader :featured_image, ImageUploader
end
