require "recommender/engine"

module Recommender
  include ActiveSupport::Configurable
  config_accessor :product_class_name, :resource_class_name
  config_accessor :product_keys, :resource_keys

  product_keys = []
  resource_keys = []
end
