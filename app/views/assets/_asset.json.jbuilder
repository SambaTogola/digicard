json.extract! asset, :id, :name, :description, :status, :created_at, :updated_at
json.url asset_url(asset, format: :json)
