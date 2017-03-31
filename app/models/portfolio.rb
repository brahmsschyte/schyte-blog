class Portfolio < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  mount_uploader :photo, ImageUploader

  has_many :skills
  has_many :projects
  accepts_nested_attributes_for :skills, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :projects, reject_if: :all_blank, allow_destroy: true
end
