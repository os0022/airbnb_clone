class Listing < ApplicationRecord
  mount_uploaders :avatars, AvatarUploader
  has_many :reservations, dependent: :destroy
  belongs_to :user
end
