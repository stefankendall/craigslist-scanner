require 'listing'

class PageParser
  def parse_into_listings html
    doc = Nokogiri::HTML html
    listings = []
    doc.css('p.row').each do |row|
      listings << row_to_listing(row)
    end
    listings
  end

  def row_to_listing row
    link = row.css('a')[0]
    name = link.text
    link_href = link['href']

    price = row.css('.itempp')[0].text.strip
    location = row.css('.itempn')[0].text.gsub(/[\)\(]/, '').strip

    date = row.css('.itemdate')[0].text.strip

    Listing.new(:name => name, :link => link_href, :price => price, :location => location, :date => date)
  end
end