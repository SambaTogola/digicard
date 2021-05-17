json.extract! subscription, :id, :user_id, :subscription_pack_id, :status, :created_at, :updated_at
json.url subscription_url(subscription, format: :json)
