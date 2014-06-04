json.array!(@allocations) do |allocation|
  json.extract! allocation, :id, :year, :bills, :type_investments
  json.url allocation_url(allocation, format: :json)
end
