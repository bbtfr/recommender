class Recommender.Routers.Recommends extends Backbone.Router
  routes:
    'recommends': 'index'
    'recommends/:id/products': 'products'
    'recommends/:id/resources': 'resources'
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
