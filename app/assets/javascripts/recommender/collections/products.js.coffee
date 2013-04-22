class Recommender.Collections.Products extends Backbone.Collection

  model: Recommender.Models.Product

  initialize: (parent) ->
    @parent = parent
    @url = _.result(parent, 'url') + '/products'
    @on("reset", parent.updateCounts)
