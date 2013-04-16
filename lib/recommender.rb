require "recommender/engine"

module Recommender
  include ActiveSupport::Configurable
  config_accessor :product_class_name, :resource_class_name

end
