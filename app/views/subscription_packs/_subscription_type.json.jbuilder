json.extract! subscription_type, :id, :name, :description, :status, :user_id, :created_at, :updated_at
json.url subscription_type_url(subscription_type, format: :json)
