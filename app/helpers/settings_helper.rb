module SettingsHelper
  def site_title
    global.config['site_title']
  end

  def site_description
    global.config['site_description']
  end

  def site_keywords
    global.config['site_keywords']
  end

  def site_ga_tracking_id
    global.config['google_analytics_tracking_id']
  end

  def site_footer
    global.config['site_footer']
  end

  def social_email
    social.config['email']
  end

  def social_whatsup
    social.config['whatsup']
  end

  def social_network
    social.config['network']
  end

  private

  def global
    @global = Setting.friendly.find('global')
  end

  def social
    @socila = Setting.friendly.find('social')
  end
end
