class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name
      t.string :price
      t.timestamp :date
      t.string :link
      t.string :location
      t.string :market

      t.timestamps
    end
  end
end
