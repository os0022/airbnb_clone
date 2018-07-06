class FixColumnDefulte < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :listings, :verification, false
  end
end
