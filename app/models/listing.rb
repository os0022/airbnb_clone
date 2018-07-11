class Listing < ApplicationRecord
  mount_uploaders :avatars, AvatarUploader
  has_many :reservations
  belongs_to :user
end
