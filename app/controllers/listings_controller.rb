require 'scanner'

class ListingsController < ApplicationController
  @@MARKETS = %w(raleigh lexington columbus)

  def index
    listings = []
    @@MARKETS.each do |market|
      listings << Scanner.new(:query => 'iPad', :market => market).recent_listings()
    end

    @listings = listings.flatten()
    @markets = @@MARKETS
  end
end
