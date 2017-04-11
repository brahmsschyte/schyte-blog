class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :timeoutable

  TITLE = %w[Administrator Editor Author].freeze

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :posts

  validates :name, :title, :email, presence: true
  validates :name, length: { minimum: 6 }
  validates :title, inclusion: { in: TITLE }
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "is not an email" }
  validates :password, presence: true, confirmation: true, length: { minimum: 8 }, on: :create
  validates :password, allow_nil: true, confirmation: true, length: { minimum: 8 }, on: :update

  def admin?
    title.include?('Administrator')
  end
end
