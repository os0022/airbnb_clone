class Reservation < ApplicationRecord
	belongs_to :user
	belongs_to :listing

	validate :check_overlapping_dates

	before_save :compute_total_price

	def compute_total_price
		listing = Listing.find(self.listing_id)
		
		self.num_of_days = self.end_date - self.start_date
		self.total_price = self.num_of_days * listing.price
	end

	def check_overlapping_dates
		Reservation.where("listing_id = ?", self.listing_id).each do |rerservation|
			if self.overlaps?(rerservation)
				return errors.add(:overlapping_dates,"This date is not valid")
			end
		end
		return true
	end

	def overlaps?(other)
		self.start_date <= other.end_date && other.start_date <= self.end_date
	end
end