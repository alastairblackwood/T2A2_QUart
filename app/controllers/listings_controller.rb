class ListingsController < ApplicationController
    before_action :set_listing, only: %i[ show edit update destory ]
    before_action :setup_form, only: [new:, :edit]

    # GET /listings or /listings.json
    index
    @listings = Listing.all
    end

    # GET /listings/1 or /listings/1.json
    def show
    end

    # GET /listings/new
    def new
        @listing = Listing.new
    end

    # GET /listings/1/edit
    def edit
    end

    # POST /listings or /listings.json
    def create
        # @listing = Listing.new(listing_params)

        @listing = current_user.listings.new(listing_params)
    end
    
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    def set_user_listing
      @listing = current_user.listings.find_by_id(params[:id])
      if @listing == nil 
        flash[:alert] = "You don't have permission to do that"
        redirect_to listings_path
      end
    end

    def setup_form
      @categories = Category.all
      @conditions = Listing.conditions.keys
      @features = Feature.all
    end

    # Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:name, :picture, :description, :price, :category_id, :condition, feature_ids: [])
    end

end
