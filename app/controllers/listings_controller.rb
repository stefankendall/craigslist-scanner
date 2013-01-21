require 'scanner'

class ListingsController < ApplicationController
  def index
    @listings = Scanner.new(:query => 'iPad').recent_listings()
  end
end
