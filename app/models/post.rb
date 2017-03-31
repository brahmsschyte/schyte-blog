class Post < ApplicationRecord
  VISIBILITY = %w{ Public Private }

  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user

  mount_uploader :featured_image, ImageUploader

  scope :published, -> { where("draft = '#{false}' and published_at <= '#{Time.zone.now}'") }
  scope :recent, -> { order(published_at: :desc).limit(5) }

  validates :title, :body, :visibility, presence: true
  validates :title, length: { minimum: 6 }
  validates :body, length: { minimum: 256 }
  validates :visibility, inclusion: { in: VISIBILITY }

  max_paginates_per 10

  private
    def should_generate_new_friendly_id?
      if slug.blank? || title_changed?
        true
      else
        false
      end
    end
end
