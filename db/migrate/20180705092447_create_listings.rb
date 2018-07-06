class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :country
      t.string :city
      t.string :room_number
      t.string :bathroom_number
      t.string :street
      t.string :area
      t.string :price
      t.string :guest
      t.belongs_to :user

      t.timestamps
    end
  end
end
