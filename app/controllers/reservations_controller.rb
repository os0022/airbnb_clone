class ReservationsController < ApplicationController

	def index
		@reservation = Reservation.page(params[:page]).per(10)

	end
	
	def new
		@listing = Listing.find(params[:listing_id])
	end

	def show
		@listing = Listing.find(params[:listing_id])
		@reservation = Reservation.find(params[:id])
	end

	def create
		@reservation = Reservation.new(reservation_params)
		@reservation.user_id = current_user.id
		@reservation.listing_id = params[:listing_id]


		if @reservation.save
			redirect_to listing_reservation_path(params[:listing_id], @reservation)
		else
			flash[:notice] = "reservation date has been taken"
			redirect_back fallback_location: (@reservation)
		end


  		# redirect_to "/listings/#{params[:listing_id]}/reservations/#{params[:id]}"
  		
  		# rereservation_path(@reservation)
  		# 
 
	end

	def edit 
		@listing = Listing.find(params[:listing_id])
		@reservation = Reservation.find(params[:id])

	end

	def update
	  	@reservation = Reservation.find(params[:id])
	  	if current_user.access_level == "customer" && @reservation.user_id != current_user.id
	  	 	flash[:notice] = "this is not your reservation"
	  	 	redirect_back fallback_location: (@reservation)
	  	else
		  if @reservation.update(reservation_params) 
		    redirect_to listing_reservation_path(params[:listing_id], @reservation)
		  else
		    render 'edit'
		  end
		end
	end

	def destroy
	  @reservation = Reservation.find(params[:id])
	  if current_user.access_level == "customer" && @reservation.user_id != current_user.id
  	 	flash[:notice] = "this list is not yours"
  	 	redirect_back fallback_location: @reservation
  	  else
	  	@reservation.destroy
	  	redirect_to listing_reservations_path(params[:listing_id])
	 end
  end


	private

	def reservation_params
		params.require(:reservation).permit(:start_date, :end_date,:total_price,:num_of_days)
	end 


end
