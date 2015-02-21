json.array!(@item_columns) do |item_column|
  json.extract! item_column, :id, :table_id, :item_id, :column_id, :value
  json.url item_column_url(item_column, format: :json)
end
