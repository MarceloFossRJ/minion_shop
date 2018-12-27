json.extract! booking, :id, :user_id, :date, :email_sent_at, :created_at, :updated_at
json.url booking_url(booking, format: :json)
