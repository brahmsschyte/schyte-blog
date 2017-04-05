class Portfolio < ApplicationRecord
  SOCIAL = %w{ github facebook twitter }

  extend FriendlyId
  friendly_id :name, use: :slugged

  mount_uploader :photo, ImageUploader

  has_many :skills
  has_many :projects
  accepts_nested_attributes_for :skills, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :projects, reject_if: :all_blank, allow_destroy: true

  validates :title, :name, :job, :overview, :email, :address, :address_line1, presence: true
  validates :title, :name, :job, :address, :address_line1, length: { minimum: 6 }
  validates :description, :keywords, length: { maximum: 255 }
  validates :overview, length: { minimum: 128 }
  validates :social, inclusion: { in: SOCIAL }
end
