json.array!(@items) do |item|
  json.extract! item, :id, :name, :table_id
  json.url item_url(item, format: :json)
end
