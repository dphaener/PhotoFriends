json.array!(@users) do |user|
  json.extract! user, :email, :username, :password_hash, :password_salt, :avatar, :userlevel, :group_id
  json.url user_url(user, format: :json)
end
