class Recommender.Models.Recommend extends Backbone.Model
  defaults:
    dynamic_fields: [""]

  validation:
    title:
      required: true
    dynamic_fields:
      required: true

  products: =>
    @product_collection ||= new Recommender.Collections.Products(@)

  resources: =>
    @resource_collection ||= new Recommender.Collections.Resources(@)
