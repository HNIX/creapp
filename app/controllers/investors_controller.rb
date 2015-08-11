class InvestorsController < ApplicationController
  before_filter :ensure_user_checked_terms, except: [:index, :show]
  before_filter :client_or_inv_req_for_vis, only: [:show]

  #->Prelang (scaffolding:rails/scope_to_user)
  before_filter :require_user_signed_in, only: [:edit, :update]
  #before_action :set_investor, only: [:show, :edit, :update, :destroy]

  # GET /investors
  # GET /investors.json
  def index
    @investors = Investor.all
  end

  # GET /investors/1
  # GET /investors/1.json
  def show
    @investor = Investor.find(params[:id])
    if user_signed_in? && (@investor.user_id == current_user.id) && @investor.incomplete?
      redirect_to edit_user_investor_path(current_user)
    end
    @show_back_to_search = params[:search].present?

    @custom_title = @investor.user.full_name
    @custom_description = "#{@custom_title} - #{@investor.title}" #" - #{@investor.user.location_text}"
    #@custom_description += " - #{@investor.description}" if @investor.description.present?
  end

  # GET /investors/new
  # def new
  #   @investor = Investor.new
  # end

  # GET /investors/1/edit
  def edit
    if current_user.investor.present?
      @investor = current_user.investor
    else
      @investor = Investor.new(user_id: current_user.id)
      @investor.save({validate: false})
    end
  end

  # POST /investors
  # POST /investors.json
  # def create
  #   @investor = Investor.new(investor_params)
  #   @investor.user = current_user
  #
  #   respond_to do |format|
  #     if @investor.save
  #       format.html { redirect_to @investor, notice: 'Investor was successfully created.' }
  #       format.json { render :show, status: :created, location: @investor }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @investor.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /investors/1
  # PATCH/PUT /investors/1.json
  def update
    @investor = Investor.find(current_user.investor.id)

    incomplete = @investor.incomplete?
    if @investor.update(update_investor_params)
      if incomplete
        flash[:notice] = 'Your investor account has been created.'
      else
        flash[:notice] = 'Your investor account has been updated.'
      end
      redirect_to investor_signed_up_path
    else
      if incomplete
        flash[:alert] = 'Your investor account could not be created.'
      else
        flash[:alert] = 'Your investor account could not be updated.'
      end
      render :edit
    end
  end

  # DELETE /investors/1
  # DELETE /investors/1.json
  # def destroy
  #   @investor.destroy
  #   respond_to do |format|
  #     format.html { redirect_to investors_url, notice: 'Investor was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_investor
    #   @investor = Investor.find(params[:id])
    # end
    def client_or_inv_req_for_vis
      @investor = Investor.find(params[:id])
      client_or_investor_required if @investor.visibility == 'creconsole'
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def update_investor_params
      params.require(:investor).permit(:company_id, :title, :linked_in, :fax, :price_from, :price_to, :verified, :principal, :subscribed, :user_id, :phone, :phone_2, :visibility)
    end
end
