class SubscriptionPacksController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_subscription_pack, only: %i[ show edit update destroy ]

  # GET /subscription_packs or /subscription_packs.json
  def index
    @subscription_packs = SubscriptionPack.all
  end

  # GET /subscription_packs/1 or /subscription_packs/1.json
  def show
  end

  # GET /subscription_packs/new
  def new
    @subscription_pack = SubscriptionPack.new
    @subscription_pack_features = SubscriptionPackFeature.all
  end

  # GET /subscription_packs/1/edit
  def edit
    @subscription_pack_features = SubscriptionPackFeature.all
  end

  # POST /subscription_packs or /subscription_packs.json
  def create
    @subscription_pack = current_user.subscription_packs.build(subscription_pack_params)

    respond_to do |format|
      if @subscription_pack.save
        @subscription_packs = SubscriptionPack.all
        format.html { redirect_to @subscription_pack, notice: "Subscription pack was successfully created." }
        format.json { render :show, status: :created, location: @subscription_pack }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subscription_pack.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /subscription_packs/1 or /subscription_packs/1.json
  def update
    respond_to do |format|
      if @subscription_pack.update(subscription_pack_params)
        @subscription_packs = SubscriptionPack.all
        format.html { redirect_to @subscription_pack, notice: "Subscription pack was successfully updated." }
        format.json { render :show, status: :ok, location: @subscription_pack }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subscription_pack.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
      @subscription_pack = SubscriptionPack.find(params[:subscription_pack_id])
    end

  # DELETE /subscription_packs/1 or /subscription_packs/1.json
  def destroy
    @subscription_pack.destroy
    respond_to do |format|
      format.html { redirect_to subscription_packs_url, notice: "Subscription pack was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription_pack
      @subscription_pack = SubscriptionPack.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subscription_pack_params
      params.require(:subscription_pack).permit(:name, :price, :description,   subscription_pack_items_attributes: [:id,  :subscription_pack_feature_id, :quantity, :_destroy])
    end
end
