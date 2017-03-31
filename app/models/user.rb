class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :timeoutable

  TITLE = %w{ Administrator Editor Author }

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :posts

  def admin?
    title.include?('Administrator')
  end
end
