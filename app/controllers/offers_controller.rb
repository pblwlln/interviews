class OffersController < ApplicationController
  before_action :set_offer, only: [:edit, :update, :destroy, :disable, :enable]

  # GET /offers
  # GET /offers.json
  def index
    @offers = Offer.order(:created_at).all
  end

  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers
  # POST /offers.json
  def create
    @offer = Offer.new(offer_params)

    if params["offer"]["never_ends"]
      @offer.ends_at = nil
    end

    respond_to do |format|
      if @offer.save
        format.html { redirect_to offers_url, notice: 'Offer was successfully created.' }
        format.json { render :show, status: :created, location: @offer }
      else
        format.html { render :new }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    offer_update_params = offer_params

    if params.require(:offer)[:never_ends] == '1'
      offer_update_params = offer_update_params.except('ends_at(1i)', 'ends_at(2i)', 'ends_at(3i)', 'ends_at(4i)', 'ends_at(5i)')
      offer_update_params[:ends_at] = nil
    end

    respond_to do |format|
      if @offer.update(offer_update_params)
        format.html { redirect_to offers_url, notice: 'Offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def disable
    @offer.update(state: false)
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Offer was successfully disabled.' }
      format.json { render :show, status: :ok, location: @offer }
    end
  end

  def enable
    @offer.update(state: true)
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Offer was successfully enabled.' }
      format.json { render :show, status: :ok, location: @offer }
    end
  end

  def list_active
    active_offers_query = 'state = ? AND starts_at <= ? AND (ends_at IS NULL OR ends_at <= ?)'
    @offers = Offer.where(active_offers_query, true, DateTime.now, DateTime.now).order(premium: :desc)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def offer_params
      params.require(:offer).permit(:advertiser_name, :url, :description, :starts_at, :ends_at, :premium)
    end
end
