module ApplicationHelper
  def link_to_active(body, url, html_options = {})
    html_options[:class]  = '' if html_options[:class].nil?
    html_options[:class] += ' active' if current_page?(url)
    link_to body, url, html_options
  end

  def message_icon(code)
    case code.to_s
    when 'success'
      content_tag :i, nil, class: 'checkmark icon'
    when 'warning'
      content_tag :i, nil, class: 'warning icon'
    when 'error'
      content_tag :i, nil, class: 'warning icon'
    when 'notice'
      content_tag :i, nil, class: 'info icon'
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
