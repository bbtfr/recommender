class Recommender.Routers.Recommends extends Backbone.Router
  routes:
    'recommends': 'index'
    'recommends/:id/products': 'products'
    'recommends/:id/resources': 'resources'
    'recommends/:id': 'show'
    '.*': 'index'

  initialize: (options) ->
    @collection = new Recommender.Collections.Recommends()
    @collection.fetch(reset: true)

  index: ->
    view = new Recommender.Views.RecommendsIndex(collection: @collection)
    $('#container').html(view.render().el)

  display: (callback) ->
    if @collection.length == 0
      @collection.once 'reset', callback
    else
      callback()

  show: (id) ->
    @display =>
      model = @collection.get(id)
      model.resources().fetch(reset: true)
      view = new Recommender.Views.RecommendsShow(model: model)
      $('#container').html(view.render().el)

  products: (id) ->
    @display =>
      collection = @collection.get(id).products()
      collection.fetch(reset: true)
      view = new Recommender.Views.ProductsIndex(collection: collection)
      $('#container').html(view.render().el)

  resources: (id) ->
    @display =>
      collection = @collection.get(id).resources()
      collection.fetch(reset: true)
      view = new Recommender.Views.ResourcesIndex(collection: collection)
      $('#container').html(view.render().el)
