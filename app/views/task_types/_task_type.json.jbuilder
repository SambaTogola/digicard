json.extract! task_type, :id, :title, :description, :status, :user_id, :created_at, :updated_at
json.url task_type_url(task_type, format: :json)
