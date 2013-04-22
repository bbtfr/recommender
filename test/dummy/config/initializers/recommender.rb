# encoding: utf-8
Recommender.configure do |config|
  # Specify product and resource classes for recommender
  config.product_class_name = '::Product'
  config.resource_class_name = '::Image'
  
  # Specify product and resource keys (model method names) for json
  config.product_keys = [:title, :image_path]
  config.resource_keys = [:image_path]
end