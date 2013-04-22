json.extract! product, :id, :recommend_id, :product_id, :dynamic_attributes
json.extra do
  json.extract! product.product, *Recommender.product_keys if product.product
end