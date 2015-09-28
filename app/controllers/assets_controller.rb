class AssetsController < InheritedResources::Base

  # before_filter :client_or_investor_required, only: [:index, :edit, :create_message, :finish]
  # before_filter :client_required, only: [:new, :create]
  # before_filter :investor_required, only: [:new_application, :create_application]

  before_filter :required_account_is_conditional, only: [:offer, :cancel, :start, :decline]

  load_and_authorize_resource except: [:create, :create_message, :offer, :start, :cancel, :decline, :finish, :new_application, :create_application]

  def index
    if current_user.present?
      @assets = Asset.where(user_id: current_user.id)
      @asset_listings = AssetListing.where(user_id: current_user.id)
    else
      @assets_as_user = []
      @asset_listings_as_user = []
    end
    # @assets_as_investor = current_user.completed_investor_account? ? Asset.where(investor_id: current_user.investor.id) : []
  end

  def new
    @asset = Asset.new(user_id: current_user.id)
  end

  def create
    @asset = Asset.new(create_asset_params)
    authorize! :create, @asset

    if @asset.save
      flash[:notice] = 'The asset has been created.'
      redirect_to asset_path
    else
      flash[:alert] = 'The asset could not be created.'
      render :new
    end
  end

  def edit
    @asset = Asset.find(params[:id])
  end

  # def offer
  #   # The rate and availability gets locked at the time of offer
  #   state_change({direct_contact: :update_as_client, application: :update_as_investor}, ->{@asset.has_not_started?}, ->{@asset.availability = @asset.investor.availability; @asset.hourly_rate = @asset.investor.hourly_rate; @asset.offer!}, :offered, 'The asset has been offered.', 'The asset could not be offered.')
  # end
  #
  # def cancel
  #   state_change({direct_contact: :update_as_client, application: :update_as_investor}, asset_offered_lambda, ->{@asset.cancel!}, :canceled, 'The asset has been canceled.', 'The asset could not be canceled.')
  # end
  #
  # def start
  #   state_change({direct_contact: :update_as_investor, application: :update_as_client}, asset_offered_lambda, ->{@asset.start!}, :started, 'The asset has been started.', 'The asset could not be started.')
  # end
  #
  # def decline
  #   state_change({direct_contact: :update_as_investor, application: :update_as_client}, asset_offered_lambda, ->{@asset.decline!}, :declined, 'The asset has been declined.', 'The asset could not be declined.')
  # end
  #
  # def finish
  #   state_change({direct_contact: :update, application: :update}, ->{@asset.offered? || @asset.running?}, ->{@asset.finish!}, :finished, 'The asset is now finished.', 'The asset could not be finished.')
  # end

  private

  def asset_offered_lambda
    ->{@asset.offered?}
  end

  def create_asset_or_message(asset_offered, asset_message, failure_template)
    if @asset.save
      UserMailer.message_sent(@asset.other_user(current_user), @asset, asset_message, current_user, asset_offered).deliver
      flash[:notice] = asset_offered ? 'The asset has been offered.' : 'Your message has been sent.'
      redirect_to edit_asset_path(@asset)
    else
      flash[:alert] = asset_offered ? 'The asset could not be offered.' : 'Your message could not be sent.'
      render failure_template
    end
  end

  def required_account_is_conditional
    @asset = Asset.find(params[:id])
    if action_name == 'offer' || action_name == 'cancel'
      @asset.kind_of?(AssetFromDirectContact) ? client_required : investor_required
    elsif action_name == 'start' || action_name == 'decline'
      @asset.kind_of?(AssetFromDirectContact) ? investor_required : client_required
    end
  end

  def offer_asset_with_message(asset)
    if params[:'offer-contract'].present? && asset.has_not_started? && (asset.is_client?(current_user) != asset.kind_of?(AssetFromApplication))
      asset.state = 'offered'
      asset.started_at = Time.now
      return true
    end
    false
  end

  def state_change(permission_required_hash, state_required, action, action_name, success_message, failure_message)
    @asset = Asset.find(params[:id])
    permission_required = @asset.kind_of?(AssetFromApplication) ? permission_required_hash[:application] : permission_required_hash[:direct_contact]
    authorize! permission_required, @asset
    if state_required.call
      action.call
      UserMailer.state_occurred_to_asset(@asset.other_user(current_user), @asset, current_user, action_name).deliver
      flash[:notice] = success_message
    else
      flash[:alert] = failure_message
    end
    redirect_to action: :edit
  end

  def redirect_to_existing_asset(investor, client)
    existing_assets = Asset.where('investor_id = ? AND client_id = ? AND (state = ? OR state = ? OR state = ?)', investor.id, client.id, 'has_not_started', 'offered', 'running')
    redirect_to edit_asset_path(existing_assets.first) unless existing_assets.empty?
  end

  def create_asset_params
    params.require(:asset).permit(:investor_id, :name, asset_messages_attributes: [:content])
  end

  def create_asset_application_params
    params.require(:asset).permit(:asset_listing_id, :rate_type, :hourly_rate, :fixed_rate, asset_messages_attributes: [:content])
  end

  def create_message_params
    params.require(:asset_message).permit(:content)
  end
end

