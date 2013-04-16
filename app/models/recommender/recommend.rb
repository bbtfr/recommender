module Recommender
  class Recommend < ActiveRecord::Base
    attr_accessible :title, :dynamic_fields
    serialize :dynamic_fields
    has_many :products
    has_many :resources

    accepts_nested_attributes_for :products, :allow_destroy => true
    accepts_nested_attributes_for :resources, :allow_destroy => true


    def get_centre resources
      points = []
      resources.each do |point|
        point = point.dynamic_attributes unless point.kind_of? Hash
        points.push point
      end

      ret = {}
      length = points.length
      dynamic_fields.each do |field|
        ret[field] = 0.0
        points.each do |point|
          ret[field] += point.fetch(field, 0).to_f
        end
        ret[field] /= length
      end
      ret
    end

    def get_distance pointA, pointB
      ret = 0.0
      pointA = pointA.dynamic_attributes unless pointA.kind_of? Hash
      pointB = pointB.dynamic_attributes unless pointB.kind_of? Hash
      dynamic_fields.each do |field|
        vA = pointA.fetch(field, 0).to_f
        vB = pointB.fetch(field, 0).to_f
        ret += (vA-vB)**2
      end
      Math.sqrt ret
    end

    def get_closest resources
      centre = get_centre resources
      products.min_by do |product|
        get_distance(product.dynamic_attributes, centre)
      end
    end
  end
end
