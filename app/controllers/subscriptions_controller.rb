class SubscriptionsController < ApplicationController
  before_action :authenticate_user!
  layout "front"
  before_action :set_subscription, only: %i[ show edit update destroy ]

  before_action :set_subscription_pack, only: %i[new_guest_subscription]

  # GET /subscriptions or /subscriptions.json
  def index
    @subscriptions = current_user.subscriptions
    render layout: "dashboard"
  end

  # GET /subscriptions/1 or /subscriptions/1.json
  def show
  end

  # GET /subscriptions/new
  def new
    @subscription_packs = SubscriptionPack.all
    @subscription_types = SubscriptionType.all
    @subscription = Subscription.new
    #render layout: "front"
  end

  def new_guest_subscription
    puts "SUBSCRPTION PLAN: #{@subscription_pack}"
    @subscription_packs = SubscriptionPack.all
    @selected_pack = SubscriptionPack.find_by(uid: @subscription_pack.uid)
    @subscription_types = SubscriptionType.all

    if subscription_params
      create 
      return
    end

    @subscription = Subscription.new
    #render :new_guest_subscription

    #render layout: "front"
  end

  # GET /subscriptions/1/edit
  def edit
  end

  # POST /subscriptions or /subscriptions.json
  def create
    puts "PARAMS: #{params[:action]}"
    @subscription = current_user.subscriptions.build(subscription_params)

    if params[:pack]
      @subscription.subscription_pack_id = SubscriptionPack.find_by(uid: params[:pack]).id
      
    end

    respond_to do |format|
      if @subscription.save
        format.html { redirect_to subscription_success_path, notice: "Subscription was successfully created." }
        format.json { render :show, status: :created, location: @subscription }
        format.js
      else

          @subscription_packs = SubscriptionPack.all
          @selected_pack = SubscriptionPack.find_by(uid: @subscription_pack.uid)
          @subscription_types = SubscriptionType.all

          if params[:action] == "new_guest_subscription"
            format.html { render :new_guest_subscription, status: :unprocessable_entity }

          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @subscription.errors, status: :unprocessable_entity }
            format.js
          end
      end
    end
  end

  def success
  end

  # PATCH/PUT /subscriptions/1 or /subscriptions/1.json
  def update
    respond_to do |format|
      if @subscription.update(subscription_params)
        format.html { redirect_to @subscription, notice: "Subscription was successfully updated." }
        format.json { render :show, status: :ok, location: @subscription }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscriptions/1 or /subscriptions/1.json
  def destroy
    @subscription.destroy
    respond_to do |format|
      format.html { redirect_to subscriptions_url, notice: "Subscription was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    def set_subscription_pack
      @subscription_pack = SubscriptionPack.find_by(uid: params[:pack])
    end

    # Only allow a list of trusted parameters through.
    def subscription_params
      if params[:subscription].nil? || params[:subscription].empty?
       false
      else
        params.require(:subscription).permit(:subscription_pack_id, :subscription_type_id, :quantity, :status)
      end
    end
end
