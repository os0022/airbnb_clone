class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :access_level , :integer, :default => 0
  end
end