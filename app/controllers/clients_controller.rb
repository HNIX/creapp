class ClientsController < ApplicationController
  before_filter :ensure_user_checked_terms, only: [:new, :create]
  before_filter :client_required, only: [:edit, :update]
  before_filter :ensure_no_client, only: [:new, :create]
  load_and_authorize_resource
  #->Prelang (scaffolding:rails/scope_to_user)
  before_filter :require_user_signed_in, only: [:new, :edit, :create, :update]

  def new
    @client = Client.new(user_id: current_user.id)
  end

  # GET /clients/1/edit
  def edit
    @client = current_user.client
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)
    @client.user = current_user
    if @client.save
      flash[:notice] = 'Your client account has been created'
      redirect_to client_signed_up_path

    else
      flash[:alert] = 'Your client account could not be created.'
      render :new
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    @client = Client.find(current_user.client.id)
    if @client.update(client_params)
      flash[:notice] = 'Your client account has been updated.'
    else
      flash[:alert] = 'Your client account could not be updated.'
    end
    render :edit
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:user_id, :name, :subdomain, :url, :description, :company)
    end

    def ensure_no_client
      redirect_to action: :edit if current_user.client.present?
    end
end
