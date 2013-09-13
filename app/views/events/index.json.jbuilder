json.array!(@events) do |event|
  json.extract! event, :when, :where, :user_id, :text, :group_id
  json.url event_url(event, format: :json)
end
