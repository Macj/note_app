json.extract! note, :id, :title, :body, :signal_date, :created_at, :updated_at
json.url note_url(note, format: :json)
