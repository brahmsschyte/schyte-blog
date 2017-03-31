module PortfoliosHelper
  def social_pick(portfolio)
    social = Setting.friendly.find('social')['config']['network'][portfolio.social]
    link_to social['url'], class: 'item' do
      '<i class="github icon"></i>'.html_safe + social['handle']
    end
  end
end
