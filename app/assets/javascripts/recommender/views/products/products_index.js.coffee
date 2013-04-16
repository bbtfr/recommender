class Recommender.Views.ProductsIndex extends Backbone.View

  template: JST['recommender/templates/products/index']

  events:
    "click .new": "new"
    "click .save": "save"

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @add, this)

  add: (model) =>
    view = new Recommender.Views.ProductsModel({collection: @collection, model : model})
    @$("tbody").append(view.render().el)

  new: (e) ->
    @collection.create()

    false

  save: (e) ->
    @$("tbody tr").each (i, tr) ->
      $(tr).trigger('save')

  render: ->
    @$el.html(@template(collection: @collection))
    @collection.each(@add)
    this