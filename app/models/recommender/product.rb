module Recommender
  class Product < ActiveRecord::Base
    attr_accessible :product_id, :dynamic_attributes
    belongs_to :recommend
    belongs_to :product, class_name: Recommender.product_class_name
    serialize :dynamic_attributes
  end
end
