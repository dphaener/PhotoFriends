json.array!(@comments) do |comment|
  json.extract! comment, :user_id, :gallery_id, :text
  json.url comment_url(comment, format: :json)
end
