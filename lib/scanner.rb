require 'open-uri'
require 'page_parser'

class Scanner
  def initialize args={}
    @query = args[:query]
    @market = args[:market]
  end

  def recent_listings
    html = get_page_html(build_url)
    page_parser_new = PageParser.new()
    listings = page_parser_new.parse_into_listings html
    listings.each { |l| l.market = @market }
    listings
  end

  def get_page_html url
    if Rails.env == "production"
      open(url, :proxy => 'http://188.142.69.193:80').read
    else
      open(url).read
    end
  end

  def build_url
    "http://#@market.craigslist.org/search/ele?srchType=T&zoomToPosting=&query=#@query&minAsk=&maxAsk="
  end
end