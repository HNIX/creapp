class AssetListingsController < ApplicationController
  before_filter :client_required, only: [:new, :create, :edit, :update]

  load_and_authorize_resource

  def index
    if user_signed_in?
      @asset_listings = AssetListing.where(visibility: [:public, :creconsole])
    else
      @asset_listings = AssetListing.where(visibility: :public)
    end
    @asset_listings = @asset_listings.where(ended: [:false, nil])
  end

  def show
    @show_back_to_search = params[:search].present?
    @asset_listing = AssetListing.find(params[:id])
  end

  def new
    @asset_listing = AssetListing.new(client_id: current_user.client.id, visibility: :public)
  end

  def create
    @asset_listing = AssetListing.new(asset_listing_params)
    @asset_listing.client = current_user.client

    if @asset_listing.save
      flash[:notice] = 'The asset listing has been created.'
      redirect_to asset_listings_path
    else
      flash[:alert] = 'The asset listing could not be created.'
      render :new
    end
  end

  def edit
    @asset_listing = AssetListing.find(params[:id])
  end

  def update
    @asset_listing = AssetListing.find(params[:id])
    if @asset_listing.update(asset_listing_params)
      flash[:notice] = 'The asset listing has been updated.'
      redirect_to asset_listings_path
    else
      flash[:alert] = 'The asset listing could not be updated.'
      render :edit
    end
  end

  protected

  def asset_listing_params
    params.require(:asset_listing).permit(:name, :title, :description, :visibility, :'offer_date(1i)', :'offer_date(2i)', :'offer_date(3i)')
  end
end