class Recommender.Collections.Resources extends Backbone.Collection

  model: Recommender.Models.Resource

  initialize: (parent) ->
    @parent = parent
    @url = parent.url() + '/resources'
    @on("reset", parent.updateCounts)
