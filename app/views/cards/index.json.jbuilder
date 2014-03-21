json.array!(@cards) do |card|
  json.extract! card, :id, :card_name, :card_logo, :card_publisher, :shops_maxcount, :card_intro, :website, :create_time
  json.url card_url(card, format: :json)
end
