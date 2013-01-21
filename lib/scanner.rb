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
      listing.name.include?(@query)
    end
  end

  def get_page_html url
    open(url).read
  end

  def build_url
    "http://raleigh.craigslist.org/search/ele?srchType=A&zoomToPosting=&query=#@query&minAsk=&maxAsk="
  end
end