class AssetListingsController < ApplicationController
  before_filter :client_required, only: [:new, :create, :edit, :update]

  # GET /AssetListings
  # GET /AssetListings.json
  def index
    if user_signed_in?
      @asset_listings = AssetListing.where(visibility: :public)
    else
      @asset_listings = AssetListing
    end
    @asset_listings = @asset_listings.where('ended = false OR ended IS NULL')
  end

  # GET /AssetListings/1
  # GET /AssetListings/1.json
  def show
  end

  # GET /AssetListings/new
  def new
    @asset_listing = AssetListing.new(client_id: current_user.client.id, visibility: :public)
  end

  # GET /AssetListings/1/edit
  def edit
  end

  # POST /AssetListings
  # POST /AssetListings.json
  def create
    @asset_listing = AssetListing.new(asset_params)
    @asset_listing.client = current_user.client

    respond_to do |format|
      if asset_listing.save
        format.html { redirect_to asset_listing, notice: 'Asset Listing was successfully created.' }
        format.json { render :show, status: :created, location: asset_listing }
      else
        format.html { render :new }
        format.json { render json: asset_listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /AssetListings/1
  # PATCH/PUT /AssetListings/1.json
  def update
    @asset_listing = AssetListing.find(params[:id])
    respond_to do |format|
      if asset_listing.update(asset_params)
        format.html { redirect_to asset_listing, notice: 'Asset Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: asset_listing }
      else
        format.html { render :edit }
        format.json { render json: asset_listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /AssetListings/1
  # DELETE /AssetListings/1.json
  # def destroy
  #   asset_listing.destroy
  #   respond_to do |format|
  #     format.html { redirect_to assets_url, notice: 'Asset Listing was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asset
      asset_listing = AssetListing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asset_listing_params
      params.require(:asset_listing).permit(:client_id, :name, :description, :size, :land_size, :price, :price_psf, :hide_price, :cap_rate, :occupancy, :highlights, :year_built, :state, :visibility)
    end
end
