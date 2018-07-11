class ListingsController < ApplicationController
  

  def index
  	@listing = Listing.page(params[:page]).per(10)
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
  end

  def edit
  	@listing = Listing.find(params[:id])
  	
  end

  def update
  	@listing = Listing.find(params[:id])
  	if current_user.access_level == "customer" && @listing.user_id != current_user.id
  	 	flash[:notice] = "this list is not yours"
  	 	redirect_back fallback_location: @listing
  	else
	  if @listing.update(listing_params) 
	    redirect_to @listing
	  else
	    render 'edit'
	  end
	end
  end

  def destroy
	  @listing = Listing.find(params[:id])
	  if current_user.access_level == "customer" && @listing.user_id != current_user.id
  	 	flash[:notice] = "this list is not yours"
  	 	redirect_back fallback_location: @listing

  	  else
	  @listing.destroy
	 
	  redirect_to listings_path
	 end
  end

  def verify
  	@listing = Listing.find(params[:id])

  	@listing.update(verification: true)

  	redirect_back fallback_location: @listing

  end

  def create
  
  	@listing = Listing.new(listing_params)
 	@listing.user_id = current_user.id
  	@listing.save
  	redirect_to @listing
  end



  private
  def listing_params
    params.require(:listing).permit(:name, :property_type, :place_type, :country, :city,:room_number, :bathroom_number, :street, :area, :price, :guest, {avatars: []})
  end 


end

