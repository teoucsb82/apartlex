json.array!(@properties) do |property|
  json.extract! property, :id, :street, :city, :state, :zip, :account_id
  json.url property_url(property, format: :json)
end
