class RequestSubjectsController < ApplicationController
  before_action :set_request_subject, only: %i[ show edit update destroy ]

  # GET /request_subjects or /request_subjects.json
  def index
    @request_subjects = RequestSubject.all
  end

  # GET /request_subjects/1 or /request_subjects/1.json
  def show
  end

  # GET /request_subjects/new
  def new
    @request_subject = RequestSubject.new
  end

  # GET /request_subjects/1/edit
  def edit
  end

  # POST /request_subjects or /request_subjects.json
  def create
    @request_subject = RequestSubject.new(request_subject_params)

    respond_to do |format|
      if @request_subject.save
        format.html { redirect_to @request_subject, notice: "Request subject was successfully created." }
        format.json { render :show, status: :created, location: @request_subject }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @request_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /request_subjects/1 or /request_subjects/1.json
  def update
    respond_to do |format|
      if @request_subject.update(request_subject_params)
        format.html { redirect_to @request_subject, notice: "Request subject was successfully updated." }
        format.json { render :show, status: :ok, location: @request_subject }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @request_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_subjects/1 or /request_subjects/1.json
  def destroy
    @request_subject.destroy
    respond_to do |format|
      format.html { redirect_to request_subjects_url, notice: "Request subject was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_subject
      @request_subject = RequestSubject.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def request_subject_params
      params.require(:request_subject).permit(:request_id, :subject_name, :status)
    end
end
