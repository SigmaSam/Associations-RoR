json.extract! event, :id, :title, :body, :date, :location, :creator_id, :created_at, :updated_at
json.url event_url(event, format: :json)
