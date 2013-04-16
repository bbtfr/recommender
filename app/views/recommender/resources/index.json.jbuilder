json.array!(@resources) do |resource|
  json.extract! resource, :id, :recommend_id, :resource_id, :dynamic_attributes
end