class SubscriptionPackItemsController < ApplicationController
  before_action :set_subscription_pack_item, only: %i[ show edit update destroy ]

  # GET /subscription_pack_items or /subscription_pack_items.json
  def index
    @subscription_pack_items = SubscriptionPackItem.all
  end

  # GET /subscription_pack_items/1 or /subscription_pack_items/1.json
  def show
  end

  # GET /subscription_pack_items/new
  def new
    @subscription_pack_item = SubscriptionPackItem.new
  end

  # GET /subscription_pack_items/1/edit
  def edit
  end

  # POST /subscription_pack_items or /subscription_pack_items.json
  def create
    @subscription_pack_item = SubscriptionPackItem.new(subscription_pack_item_params)

    respond_to do |format|
      if @subscription_pack_item.save
        format.html { redirect_to @subscription_pack_item, notice: "Subscription pack item was successfully created." }
        format.json { render :show, status: :created, location: @subscription_pack_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subscription_pack_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subscription_pack_items/1 or /subscription_pack_items/1.json
  def update
    respond_to do |format|
      if @subscription_pack_item.update(subscription_pack_item_params)
        format.html { redirect_to @subscription_pack_item, notice: "Subscription pack item was successfully updated." }
        format.json { render :show, status: :ok, location: @subscription_pack_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subscription_pack_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscription_pack_items/1 or /subscription_pack_items/1.json
  def destroy
    @subscription_pack_item.destroy
    respond_to do |format|
      format.html { redirect_to subscription_pack_items_url, notice: "Subscription pack item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription_pack_item
      @subscription_pack_item = SubscriptionPackItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subscription_pack_item_params
      params.require(:subscription_pack_item).permit(:subscription_pack_id, :subscription_pack_feature_id, :quantity, :status, :user_id)
    end
end
