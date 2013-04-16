json.array!(@recommends) do |recommend|
  json.extract! recommend, :id, :title, :dynamic_fields
end