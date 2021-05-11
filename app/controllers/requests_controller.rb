class RequestsController < ApplicationController
  authorize_resource except: [:new_front_request]
  before_action :authenticate_user! unless :front_origin?
  before_action :front_origin?, only: [:new]
  before_action :set_request, only: [:show, :edit, :update,:generate_pdf, :destroy]
 
  # GET /requests
  # GET /requests.json
  def index

    @current_user_requests = current_user.requests
    @imputations = Imputation.where(imputable_type: "Request").where("recipient_id = ? OR user_id = ?", current_user.id, current_user.id)
    render layout: "dashboard"
    record_activity("Afficher la liste des démandes.")

  end

  # GET /requests/1
  # GET /requests/1.json
  def show
    render layout: "dashboard"
  end


  #For PDF
  def generate_pdf

    puts "REQUESTS: #{@request}"
    respond_to do |format|
        format.html
        format.pdf do
            render :pdf => "request-#{@request.identification_number}-#{Time.now}", 
            layout: 'pdf',
            page_size: 'A4',
            template: "requests/pdf.html.erb",
            lowquality: true,
            zoom: 1,
            dpi: 75
        end
    end

    #render layout: "pdf"
  end

  def get_kairos_data
    data = params[:id]
    user = KairosUser.find_by(username: data)
    puts "USER: #{user.inspect}"
    etudiant = KairosEtudiant.find(user.id)
    puts "ETUDIANT: #{etudiant.inspect}"
    inscription_etudiant = KairosInscriptionEtudiant.find_by(etudiant_id: etudiant.id)
    
    puts "INSCRIPTION ETUDIANT: #{inscription_etudiant.inspect}"

   
    classe = KairosClasse.find(inscription_etudiant.classe_id)
    puts "CLASSE: #{classe.inspect}"

    data = {:user => user, :etudiant => etudiant, classe: classe}
    render :json => data
  
  end

  def get_kairos_annee_scolaire
    annee_scolaire = params[:annee_scolaire]
    username = params[:username]

    puts "ANNEE SCOLAIRE: #{annee_scolaire}"
    puts "ETUDIANT ID: #{username}"

    user = KairosUser.find_by(username: username)

    etudiant = KairosEtudiant.find(user.id)
    
    puts "ETUDIANT : #{etudiant.inspect}"


    # Programme etudiant.
    etudiant_programmes = KairosProgrammeEtudiant.where(etudiant_id: etudiant.id)

    puts "ETUDIANT PROGRAMMES: #{etudiant_programmes.inspect}"

    annee_scolaire_programmes = KairosAnneeScolaireProgramme.where(annee_scolaire: annee_scolaire)

    puts "ANNEE SCOLAIRE PROGRAMME: #{annee_scolaire_programmes.inspect}"

    selected_etudiant_programme = nil

    if etudiant_programmes.present? && annee_scolaire_programmes.present?
      
      annee_scolaire_programmes.each do |annee_scolaire_programme|
        selected_etudiant_programme = etudiant_programmes.where(annee_scolaire_programme_id: annee_scolaire_programme).first

        if selected_etudiant_programme.present?
          break 
        end

      end

    end

    puts "SELECTED PROGRAMME: #{selected_etudiant_programme.inspect}"
    #inscription_etudiant = KairosInscriptionEtudiant.where("annee_scolaire_programme_id = ? AND etudiant_id = ?", annee_scolaire_programme.id, etudiant_id)
    #puts "INSCRIPTION ETUDIANT: #{inscription_etudiant.inspect}"


    # Classe
    classe = KairosProgramme.find(selected_etudiant_programme.programme_id)
    
    puts "CLASSE: #{classe.inspect}"
    #classe = nil

    data = {classe: classe}
    render :json => data

  end

  # GET /requests/new
  def new
    @request_types = RequestType.all
    @request = Request.new
    render layout: "dashboard"
  end

  def new_front_request
    @request_types = RequestType.all
    @request = Request.new
    render layout: "front"
  end

  # GET /requests/1/edit
  def edit
    @request_types = RequestType.all
    render  layout: "dashboard"
  end

  def front_request_success
    render layout: "front"
  end

  # POST /requests
  # POST /requests.json
  def create
    if current_user.present?
      @request = current_user.requests.build(request_params)

      respond_to do |format|
        if @request.save
          record_activity("Créer une nouvelle démande (ID: #{@request.id})")

          @current_user_requests = current_user.requests

          format.html { redirect_to requests_path, notice: 'Request was successfully created.' }
          format.json { render :show, status: :created, location: @request }
          format.js
        else
          format.html { render :new }
          format.json { render json: @request.errors, status: :unprocessable_entity }
          format.js
        end
      end
    else 
      @request = Request.new(request_params)

      respond_to do |format|
        if  @request.save
          record_activity("Créer une nouvelle démande (ID: #{@request.id})")

          format.html { redirect_to front_request_success_path, notice: 'Request was successfully created.' }
          format.json { render :show, status: :created, location: @request }
          
        else
          @request_types = RequestType.all
          format.html { render :new_front_request }
          format.json { render json: @request.errors, status: :unprocessable_entity }
          
        end
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        @current_user_requests = current_user.requests
        record_activity("Modifier une démande (ID: #{@request.id})")

        format.html { redirect_to requests_path, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end


  def delete
    @request = Request.find(params[:request_id])
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      record_activity("Supprimer une démande (ID: #{@request.id})")

      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      if params[:id].present?
      @request = Request.find(params[:id])
      elsif params[:uid]
        @request = Request.find_by(uid: params[:uid])
      end
    end

    # Only allow a list of trusted parameters through.
    def request_params
      params.require(:request).permit(:request_type_id, :first_name, :last_name, :gender, :born_date, :born_place, :academic_year, :grade, :specialty, :request_date, :identification_number, :description, :status)
    end

    def front_origin?
      origin = params[:origin]

      if origin.present? && origin == "front"
        @@front_origin ||= true
        true
      else
        @@front_origin ||= false
        false
      end
      
    end

    
end
