class Recommender.Routers.RecommendShow extends Backbone.Router
  routes:
    'recommends': 'index'
    '.*': 'index'

  initialize: (options) ->
    @model = new Recommender.Models.Recommend()
    @model.fetch()

  index: ->
    @model.resources().fetch(reset: true)
    view = new Recommender.Views.RecommendsShow(model: @model)
    $('#container').html(view.render().el)
