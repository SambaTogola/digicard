json.extract! invitation, :id, :organization_id, :service_id, :position, :status, :user_id, :recipient_id, :created_at, :updated_at
json.url invitation_url(invitation, format: :json)
