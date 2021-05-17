json.extract! subscription_pack_item, :id, :subscription_pack_id, :subscription_pack_feature_id, :quantity, :status, :user_id, :created_at, :updated_at
json.url subscription_pack_item_url(subscription_pack_item, format: :json)
