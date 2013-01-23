require 'open-uri'
require 'page_parser'

class Scanner
  def initialize args={}
    @query = args[:query]
  end

  def recent_listings
    html = get_page_html(build_url)
    listings = PageParser.new().parse_into_listings html
    filter_listings_by_query listings
  end

  def filter_listings_by_query listings
    listings.select do |listing|
      listing.name.downcase.include?(@query.downcase)
    end
  end

  def get_page_html url
    if Rails.env == "production"
      open(url, :proxy => 'http://188.142.69.193:80').read
    else
      open(url).read
    end
  end

  def build_url
    "http://raleigh.craigslist.org/search/ele?srchType=A&zoomToPosting=&query=#@query&minAsk=&maxAsk="
  end
end