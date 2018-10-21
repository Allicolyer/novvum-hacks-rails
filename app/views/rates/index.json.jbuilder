json.array!(@rates) do |rate|
  json.extract! rate, :id, :startCity, :endCity, :date, :price, :comment
  json.url rate_url(rate, format: :json)
end
