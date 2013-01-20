require 'spec_helper'
require "scanner"

describe Scanner do
  it "should get listings from craigslist" do
    cs = Scanner.new
    recent_listings = cs.recent_listings()
    recent_listings.should_not be_empty
  end

  it "should build urls for raleigh, iPads, electronics by owner" do
    cs = Scanner.new
    cs.build_url().should == "http://raleigh.craigslist.org/search/ele?srchType=A&zoomToPosting=&query=iPad&minAsk=&maxAsk="
  end

  it "should get the page html for a url" do
    cs = Scanner.new
    html = cs.get_page_html(cs.build_url())
    html.should include "<!DOCTYPE"
  end
end