class FixColumnState < ActiveRecord::Migration[5.2]
  def change
  	change_column :listings, :verification , :boolean, :default => false
  end
end
