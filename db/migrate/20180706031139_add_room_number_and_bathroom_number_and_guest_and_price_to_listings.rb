class AddRoomNumberAndBathroomNumberAndGuestAndPriceToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :room_number, :integer
    add_column :listings, :bathroom_number, :integer
    add_column :listings, :guest, :integer
    add_column :listings, :price, :integer
  end
end
