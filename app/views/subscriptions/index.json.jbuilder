json.array!(@subscriptions) do |subscription|
  json.extract! subscription, :id, :account_id, :type_of, :active, :start_date, :end_date
  json.url subscription_url(subscription, format: :json)
end
