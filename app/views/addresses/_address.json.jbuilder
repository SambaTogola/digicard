json.extract! address, :id, :address_1, :address_2, :phone_1, :phone_2, :country, :city, :zip_code, :po_box, :street, :door, :status, :created_at, :updated_at
json.url address_url(address, format: :json)
