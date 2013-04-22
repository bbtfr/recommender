json.array!(@resources) do |resource|
  json.extract! resource, :id, :recommend_id, :resource_id, :dynamic_attributes
  json.extra do
    json.extract! resource.resource, *Recommender.resource_keys if resource.resource
  end
end