class RemoveRoomNumberAndBathroomNumberAndGuestAndPriceFromListings < ActiveRecord::Migration[5.2]
  def change
    remove_column :listings, :room_number, :string
    remove_column :listings, :bathroom_number, :string
    remove_column :listings, :guest, :string
    remove_column :listings, :price, :string
  end
end
