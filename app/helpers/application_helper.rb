module ApplicationHelper
  def link_to_active(body, url, html_options = {})
    html_options[:class]  = '' if html_options[:class].nil?
    html_options[:class] += ' active' if current_page?(url)
    link_to body, url, html_options
  end

  def message_icon(code)
    case code.to_s
    when 'success'
      "<i class='checkmark icon'></i>".html_safe
    when 'warning'
      "<i class='warning icon'></i>".html_safe
    when 'error'
      "<i class='warning sign icon'></i>".html_safe
    when 'notice'
      "<i class='info icon'></i>".html_safe
    end
  end

  def message_type(code)
    case code.to_s
    when 'notice'
      'info'
    when 'timedout'
      'info timed out'
    else
      code.to_s
    end
  end
end
