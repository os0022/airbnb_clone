class SearchController < ApplicationController
	def index
		@listing = Listing.where(nil)
		@listing = Listing.page(params[:page]).per(3)

		@listing = @listing.price_range(params[:from],params[:to]) if params[:from].present? || params[:to].present?

    filtering_params(params).each do |key, value|
      @listing = @listing.public_send(key, value) if value.present?
    end

    respond_to do |format|
      format.html
      format.js { render :layout => false }
      format.json {render json: @listing}
    end
	end


private
def filtering_params(params)
    params.slice(:city, :room_number, :bathroom_number, :property_type, :namesearch, :starts_with)
  end

end
