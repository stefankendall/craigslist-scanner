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
    listing = Listing.new

    link = row.css('a')[0]
    listing.name = link.text
    listing.link = link['href']

    listing.price = row.css('.itempp')[0].text.strip
    date_as_text = row.css('.itemdate')[0].text.strip
    listing.date = Date.parse date_as_text
    listing
  end
end