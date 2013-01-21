class Listing
  attr_accessor :name, :price, :date, :link, :location

  def initialize args={}
    @name = args[:name]
    @price = args[:price]
    @date = args[:date]
    @link = args[:link]
  end
end