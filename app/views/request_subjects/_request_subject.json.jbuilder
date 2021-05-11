json.extract! request_subject, :id, :request_id, :subject_name, :status, :created_at, :updated_at
json.url request_subject_url(request_subject, format: :json)
