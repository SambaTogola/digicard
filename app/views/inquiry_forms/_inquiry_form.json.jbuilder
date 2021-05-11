json.extract! inquiry_form, :id, :uid, :full_name, :phone, :email, :message, :property_id, :recipient_id, :read, :read_at, :status, :user_id, :created_at, :updated_at
json.url inquiry_form_url(inquiry_form, format: :json)
