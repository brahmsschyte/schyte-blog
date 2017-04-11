module PortfoliosHelper
  def social_pick(portfolio)
    social = Setting.friendly.find('social')['config']['network'][portfolio.social]
    link_to social['url'], class: 'item' do
      content_tag :i, nil, class: 'github icon' + social['handle']
    end
  end
end
