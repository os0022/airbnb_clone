class Listing < ApplicationRecord
  mount_uploaders :avatars, AvatarUploader
  has_many :reservations, dependent: :destroy
  belongs_to :user

  scope :city, -> (city) { where("city like ?", "%#{city}%") }
  scope :room_number, -> (room_number) { where room_number: room_number }
  scope :property_type, -> (property_type) { where("property_type ilike ?", "#{property_type}") }
  scope :bathroom_number, -> (bathroom_number) { where bathroom_number: bathroom_number }
  scope :namesearch, -> (namesearch) { where("name like ?", "%#{namesearch}%")}
  scope :price_range, -> (from,to) {where ("price >= ? AND price <= ?"), from, to}

end
