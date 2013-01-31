class Listing < ActiveRecord::Base
  attr_accessible :date, :link, :location, :market, :name, :price
end
