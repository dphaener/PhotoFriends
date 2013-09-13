json.array!(@galleries) do |gallery|
  json.extract! gallery, :name, :archive, :group_id
  json.url gallery_url(gallery, format: :json)
end
