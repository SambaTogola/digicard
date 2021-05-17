json.extract! company, :id, :company_type_id, :activity_field_id, :name, :description, :status, :user_id, :created_at, :updated_at
json.url company_url(company, format: :json)
