class Setting < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  validate :validate_global_setting

  def validate_global_setting
    if name == 'Global' && config.present?
      config.each do |key,value|
        case key
        when 'site_title'
          if value.present?
            if value.size < 6
              errors.add(:site_title, "#{key.humanize} is too short (minimum is 6 characters)")
            end
          else
            errors.add(:site_title, "#{key.humanize} can't be blank")
          end
        when 'site_description'
          if value.present?
            if value.size > 255
              errors.add(:site_description, "#{key.humanize} is too long (maximum is 255 characters)")
            end
          end
        when 'site_keywords'
          if value.present?
            if value.size > 255
              errors.add(:site_description, "#{key.humanize} is too long (maximum is 255 characters)")
            end
          end
        when 'site_footer'
          if value.present?
            if value.size > 127
              errors.add(:site_footer, "#{key.humanize} is too long (maximum is 127 characters)")
            end
          else
            errors.add(:site_footer, "#{key.humanize} can't be blank")
          end
        end
      end
    elsif config.present?
    else
      errors.add(:config, "Config can't be all blank")
    end
  end

end
