require 'scanner'

class ListingsController < ApplicationController
  def index
    @listings = Scanner.new.recent_listings()
  end
end
