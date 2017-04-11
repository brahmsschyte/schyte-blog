class Setting < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates_with SettingValidator
end
