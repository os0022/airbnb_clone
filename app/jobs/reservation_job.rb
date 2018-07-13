class ReservationJob < ApplicationJob
  queue_as :default

  def perform(customer, host, reservation_id, listing_id)
    # Do something later
    ReservationMailer.booking_email(customer, host, reservation_id, listing_id).deliver_now
  end
end
