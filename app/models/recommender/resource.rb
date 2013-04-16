module Recommender
  class Resource < ActiveRecord::Base
    attr_accessible :resource_id, :dynamic_attributes
    belongs_to :recommend
    belongs_to :resource, class_name: Recommender.resource_class_name
    serialize :dynamic_attributes
  end
end
