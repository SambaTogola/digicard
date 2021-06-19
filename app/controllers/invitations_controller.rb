class InvitationsController < ApplicationController

  authorize_resource
  
  before_action :authenticate_user!, except: [:confirm_invitation]
  before_action :set_invitation, only: %i[ show edit update destroy ]
  before_action :set_recipient, only: %i[ new ]

  layout "dashboard"

  # GET /invitations or /invitations.json
  def index
    @invitations = current_user.invitations
  end

  # GET /invitations/1 or /invitations/1.json
  def show
  end

  # GET /invitations/new
  def new
    @organizations = current_user.organizations
    @services = []
    @invitation = Invitation.new
  end

  # GET /invitations/1/edit
  def edit
  end

  def confirm_invitation
    invitation_uid = params[:uid]
    invitation = Invitation.find_by(uid: invitation_uid)

    member = Member.new
    member.invitation_id = invitation.invitation_id
    member.organization_id = invitation.organization_id
    member.service_id = invitation.service_id
    member.position = invitation.position
    member.user_id = invitation.recipient_id
    member.status = "Actif"

    if member.save
      invitation.update_column(:status,"Acceptée")
      redirect_to root_path
    end

  end

  def search_users
    @search_term = params[:term]

    @users = User.search_by_login_or_email(@search_term)


  end

  def get_services
    puts "ID: #{params[:id]}"
    @services = Service.where(organization_id: params[:id])
  end

  # POST /invitations or /invitations.json
  def create
    @invitation = current_user.invitations.build(invitation_params)

    respond_to do |format|
      if @invitation.save
        @url = ""
        # New thread to send mail
        Thread.new do
          Rails.application.executor.wrap do
            InvitationMailer.invitation_mail(User.find(@invitation.recipient_id), @invitation, @url).deliver_now

          end
        end

        @invitations = Invitation.all
        format.html { redirect_to invitations_path, notice: "Invitation was successfully sended." }
        format.json { render :show, status: :created, location: @invitation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @invitation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invitations/1 or /invitations/1.json
  def update
    respond_to do |format|
      if @invitation.update(invitation_params)
        format.html { redirect_to @invitation, notice: "Invitation was successfully updated." }
        format.json { render :show, status: :ok, location: @invitation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @invitation.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    @invitation = Invitation.find(params[:invitation_id])
  end

  # DELETE /invitations/1 or /invitations/1.json
  def destroy
    @invitation.destroy
    respond_to do |format|
      format.html { redirect_to invitations_url, notice: "Invitation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invitation
      @invitation = Invitation.find(params[:id])
    end

    def set_recipient
      @recipient ||= User.find_by(uid: params[:user_id])
    end

    # Only allow a list of trusted parameters through.
    def invitation_params
      params.require(:invitation).permit(:organization_id, :service_id, :position, :status,  :recipient_id)
    end
end
