json.array!(@photos) do |photo|
  json.extract! photo, :caption, :name, :path, :gallery_id
  json.url photo_url(photo, format: :json)
end
