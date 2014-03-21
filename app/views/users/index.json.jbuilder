json.array!(@users) do |user|
  json.extract! user, :id, :subscribe, :openid, :nickname, :sex, :language, :city, :province, :country, :headimgurl, :subscribe_time
  json.url user_url(user, format: :json)
end
