class FrontController < ApplicationController
	layout "front"
	def home
		@property_types = PropertyType.all
		@offer_types = OfferType.all
		@localities = OfferType.all
		@featured = Property.order(created_at: :desc).paginate(:page => params[:page], :per_page => 3)
		@properties = Property.order(created_at: :desc).paginate(:page => params[:page], :per_page => 3)
		@page_description = APPLICATION_DESCRIPTION
		@page_keywords    = APPLICATION_KEYWORDS
	end

	def properties
		@properties = Property.order(created_at: :desc).paginate(:page => params[:page], :per_page => 6)

	end
end