json.array!(@shops) do |shop|
  json.extract! shop, :id, :shop_name, :shop_logo, :phone, :category, :province, :city, :district, :address, :lat, :lng, :website, :card_type, :business_id, :last_update_time, :create_time
  json.url shop_url(shop, format: :json)
end
