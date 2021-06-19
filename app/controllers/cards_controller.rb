class CardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_card, only: %i[ show edit update destroy ]
  before_action :set_portfolio, only: %i[ index new  ]
  layout "dashboard"

  # GET /cards or /cards.json
  def index
    
    @cards = Card.where(portfolio_id: @portfolio.id)

  end

  # GET /cards/1 or /cards/1.json
  def show
  end

  # GET /cards/new
  def new
    @card = Card.new
  end

  # GET /cards/1/edit
  def edit
  end

  # POST /cards or /cards.json
  def create
    @card = current_user.cards.build(card_params)

    
    

    respond_to do |format|
      if @card.save
        @cards = Card.where(portfolio_id: @card.portfolio_id)
        format.html { redirect_to portfolio_cards_path(portfolio_id: @card.portfolio_id), notice: "Card was successfully created." }
        format.json { render :show, status: :created, location: @card }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @card.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /cards/1 or /cards/1.json
  def update
    respond_to do |format|
      if @card.update(card_params)
         @cards = Card.where(portfolio_id: @card.portfolio_id)
        format.html { redirect_to @card, notice: "Card was successfully updated." }
        format.json { render :show, status: :ok, location: @card }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @card.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def delete
    @card = Card.find(params[:card_id])
  end

  # DELETE /cards/1 or /cards/1.json
  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to cards_url, notice: "Card was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    def set_portfolio
      @portfolio ||= Portfolio.find_by(uid: params[:portfolio_id])
    end


    # Only allow a list of trusted parameters through.
    def card_params
      params.require(:card).permit(:portfolio_id, :first_name,  :last_name, :organization, :work_positio,
      :work_phone, :private_phone, :mobile_phone, :work_fax, :private_fax, :email, :street, :zipcode, :city, :country   )
    end
end


