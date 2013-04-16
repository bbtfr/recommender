class Recommender.Collections.Products extends Backbone.Collection

  model: Recommender.Models.Product

  initialize: (parent) ->
    @parent = parent
    @url = parent.url() + '/products'
    @on("reset", parent.updateCounts)
