json.array!(@products) do |product|
  json.extract! product, :id, :recommend_id, :product_id, :dynamic_attributes
end