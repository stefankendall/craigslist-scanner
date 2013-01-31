require "spec_helper"
require 'page_parser'

describe PageParser do
  it "should parse craigslist html into listings" do
    pp = PageParser.new
    listings = pp.parse_into_listings File.read('spec/files/craigslistsearch.html')
    listings.should_not be_empty
    listings[0].name.should_not be_nil
    listings[0].price.should_not be_nil
    listings[0].date.should_not be_nil
    listings[0].link.should_not be_nil
    listings[0].location.should_not be_nil

    listings.length.should == 100
  end

  it "should sanitize locations" do
    pp = PageParser.new
    listings = pp.parse_into_listings File.read('spec/files/craigslistsearch.html')
    listings[0].location.should_not include "("
  end
end