class Listing
  attr_accessor :name, :price, :date, :link, :location, :market

  def initialize args={}
    @name = args[:name]
    @price = args[:price]
    @date = args[:date]
    @link = args[:link]
    @location = args[:location]
    @market = args[:market]
  end
end