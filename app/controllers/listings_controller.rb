class ListingsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_listing, only: %i[ show ]
  before_action :set_user_listing, only: [ :update, :edit, :destroy ]
  before_action :setup_form, only: [:new, :edit]

  # GET /listings or /listings.json
  def home
  @listings = Listing.all
  end

  # GET /listings/1 or /listings/1.json
  def show
  end

  # GET /listings/new
  def new
    @listing = Listing.new
    puts current_user.email
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings or /listings.json
  def create
    # @listing = Listing.new(listing_params)

    @listing = current_user.listings.new(listing_params)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: "Listing was successfully created." }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
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
    # @conditions = Listing.conditions.keys
    @features = Feature.all
  end

  # Only allow a list of trusted parameters through.
  def listing_params
    params.require(:listing).permit(:name, :picture, :description, :price, :category_id, feature_ids: [])
  end
end