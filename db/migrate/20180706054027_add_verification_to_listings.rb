class AddVerificationToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :verification, :boolean
  end
end
