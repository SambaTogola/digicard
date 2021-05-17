json.extract! activity_field, :id, :name, :description, :status, :user_id, :created_at, :updated_at
json.url activity_field_url(activity_field, format: :json)
