json.extract! request_company, :id, :request_id, :company_name, :status, :created_at, :updated_at
json.url request_company_url(request_company, format: :json)
