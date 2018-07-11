class FixColumnProfilePicture < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :users, :profile_picture, nil
  end
end
