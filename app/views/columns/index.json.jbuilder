json.array!(@columns) do |column|
  json.extract! column, :id, :table_id, :name, :type_id, :not_null, :unique, :unit, :default_value
  json.url column_url(column, format: :json)
end
