json.extract! conference, :id, :title, :abstract, :room, :speaker, :attendees, :created_at, :updated_at
json.url conference_url(conference, format: :json)
