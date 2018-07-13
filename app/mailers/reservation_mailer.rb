class ReservationMailer < ApplicationMailer
	def booking_email(customer, host, reservation_id, listing_id)
		@listing = listing_id
		@customer = customer
		@host = host
		@reservation = reservation_id
		@url = "http://localhost:3000/listings/#{@listing}/reservations/#{@reservation}"
      
    mail to: @host, subject: "A booking has been made"
	end
end
