class AddPropertyTypeAndNameAndPlaceTypeToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :name, :string
    add_column :listings, :property_type, :string
    add_column :listings, :place_type, :int
  end
end
