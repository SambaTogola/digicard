class RequestCompaniesController < ApplicationController
  before_action :set_request_company, only: %i[ show edit update destroy ]

  # GET /request_companies or /request_companies.json
  def index
    @request_companies = RequestCompany.all
  end

  # GET /request_companies/1 or /request_companies/1.json
  def show
  end

  # GET /request_companies/new
  def new
    @request_company = RequestCompany.new
  end

  # GET /request_companies/1/edit
  def edit
  end

  # POST /request_companies or /request_companies.json
  def create
    @request_company = RequestCompany.new(request_company_params)

    respond_to do |format|
      if @request_company.save
        format.html { redirect_to @request_company, notice: "Request company was successfully created." }
        format.json { render :show, status: :created, location: @request_company }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @request_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /request_companies/1 or /request_companies/1.json
  def update
    respond_to do |format|
      if @request_company.update(request_company_params)
        format.html { redirect_to @request_company, notice: "Request company was successfully updated." }
        format.json { render :show, status: :ok, location: @request_company }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @request_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_companies/1 or /request_companies/1.json
  def destroy
    @request_company.destroy
    respond_to do |format|
      format.html { redirect_to request_companies_url, notice: "Request company was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_company
      @request_company = RequestCompany.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def request_company_params
      params.require(:request_company).permit(:request_id, :company_name, :status)
    end
end
