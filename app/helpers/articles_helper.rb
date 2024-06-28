module ArticlesHelper
  def process_raw_html_content(raw_html)
    assets = {
      'choice.png' => 'choice.png',
      'idee.png' => 'idee.png',
      'AFE.png' => 'AFE.png',
      'BGE.png' => 'BGE.png',
      'CCI.png' => 'CCI.png',
      'BPI.png' => 'BPI.png',
      'stationf.png' => 'stationf.png',
      'malt.jpg' => 'malt.jpg',
      'upwork.jpeg' => 'upwork.jpeg',
      'comeup.jpg' => 'comeup.jpg',
      'creme.jpg' => 'creme.jpg'
    }

    assets.each do |asset_name, asset_file|
      if raw_html.include?(asset_name)
        asset_url = ActionController::Base.helpers.asset_path(asset_file)
        raw_html = raw_html.gsub("app/assets/images/#{asset_name}", asset_url)
      end
    end

    routes = {
      'new_article_my_guide_path' => new_article_my_guide_path(@article.id)
    }

    routes.each do |route_name, route_path|
      if raw_html.include?(route_name)
        raw_html = raw_html.gsub(route_name, route_path)
      end
    end

    raw_html.html_safe
  end
end
