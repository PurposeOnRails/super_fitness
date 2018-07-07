json.extract! heart_rate_log, :id, :heart_rate, :date, :created_at, :updated_at
json.url heart_rate_log_url(heart_rate_log, format: :json)
