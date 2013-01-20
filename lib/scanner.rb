require 'open-uri'
require 'page_parser'

class Scanner
  def recent_listings
    html = get_page_html(build_url)
    PageParser.new().parse_into_listings html
  end

  def get_page_html url
    open(url).read
  end

  def build_url
    "http://raleigh.craigslist.org/search/ele?srchType=A&zoomToPosting=&query=iPad&minAsk=&maxAsk="
  end
end