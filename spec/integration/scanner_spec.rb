require 'spec_helper'
require "scanner"

describe Scanner do
  it "should get listings from craigslist" do
    scanner = Scanner.new(:query => 'iPad', :market => 'raleigh')
    recent_listings = scanner.recent_listings()
    recent_listings.should_not be_empty
    recent_listings[0].market.should == 'raleigh'
  end

  it "should build urls for raleigh, iPads, electronics by owner" do
    scanner = Scanner.new(:query => 'iPad', :market => "raleigh")
    scanner.build_url().should == "http://raleigh.craigslist.org/search/ele?srchType=T&zoomToPosting=&query=iPad&minAsk=&maxAsk="
  end

  it "should get the page html for a url" do
    scanner = Scanner.new(:query => 'iPad', :market => 'raleigh')
    html = scanner.get_page_html(scanner.build_url())
    html.should include "<!DOCTYPE"
  end
end