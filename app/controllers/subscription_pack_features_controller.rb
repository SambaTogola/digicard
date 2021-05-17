class SubscriptionPackFeaturesController < ApplicationController
  before_action :authenticate_user!
  layout "dashboard"

  before_action :set_subscription_pack_feature, only: %i[ show edit update destroy ]

  # GET /subscription_pack_features or /subscription_pack_features.json
  def index
    @subscription_pack_features = SubscriptionPackFeature.all
  end

  # GET /subscription_pack_features/1 or /subscription_pack_features/1.json
  def show
  end

  # GET /subscription_pack_features/new
  def new
    @subscription_pack_feature = SubscriptionPackFeature.new
  end

  # GET /subscription_pack_features/1/edit
  def edit
  end

  # POST /subscription_pack_features or /subscription_pack_features.json
  def create
    @subscription_pack_feature = current_user.subscription_pack_features.build(subscription_pack_feature_params)

    respond_to do |format|
      if @subscription_pack_feature.save
        @subscription_pack_features = SubscriptionPackFeature.all
        format.html { redirect_to @subscription_pack_feature, notice: "Subscription pack feature was successfully created." }
        format.json { render :show, status: :created, location: @subscription_pack_feature }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subscription_pack_feature.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /subscription_pack_features/1 or /subscription_pack_features/1.json
  def update
    respond_to do |format|
      if @subscription_pack_feature.update(subscription_pack_feature_params)
        @subscription_pack_features = SubscriptionPackFeature.all
        format.html { redirect_to @subscription_pack_feature, notice: "Subscription pack feature was successfully updated." }
        format.json { render :show, status: :ok, location: @subscription_pack_feature }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subscription_pack_feature.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    @subscription_pack_feature = SubscriptionPackFeature.find(params[:subscription_pack_feature_id])
  end


  # DELETE /subscription_pack_features/1 or /subscription_pack_features/1.json
  def destroy
    @subscription_pack_feature.destroy
    respond_to do |format|
      format.html { redirect_to subscription_pack_features_url, notice: "Subscription pack feature was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription_pack_feature
      @subscription_pack_feature = SubscriptionPackFeature.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subscription_pack_feature_params
      params.require(:subscription_pack_feature).permit(:name, :description, :status, :user_id)
    end
end
