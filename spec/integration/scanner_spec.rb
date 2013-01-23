require 'spec_helper'
require "scanner"

describe Scanner do
  it "should get listings from craigslist" do
    scanner = Scanner.new(:query => 'iPad')
    recent_listings = scanner.recent_listings()
    recent_listings.should_not be_empty
  end

  it "should build urls for raleigh, iPads, electronics by owner" do
    scanner = Scanner.new(:query => 'iPad')
    scanner.build_url().should == "http://raleigh.craigslist.org/search/ele?srchType=A&zoomToPosting=&query=iPad&minAsk=&maxAsk="
  end

  it "should get the page html for a url" do
    scanner = Scanner.new(:query => 'iPad')
    html = scanner.get_page_html(scanner.build_url())
    html.should include "<!DOCTYPE"
  end

  it "should filter listings by title" do
    scanner = Scanner.new(:query => 'iPad 4')
    listings = [
        Listing.new(:name => 'iPad 3'),
        Listing.new(:name => 'iPad 4'),
        Listing.new(:name => 'guitar')
    ]
    filtered = scanner.filter_listings_by_query listings
    filtered.length.should == 1
  end

  it "should ignore case when filtering" do
    scanner = Scanner.new(:query => 'iPad')
    listings = [
        Listing.new(:name => 'ipad 3'),
        Listing.new(:name => 'IPAD 4'),
        Listing.new(:name => 'guitar')
    ]
    filtered = scanner.filter_listings_by_query listings
    filtered.length.should == 2
  end
end