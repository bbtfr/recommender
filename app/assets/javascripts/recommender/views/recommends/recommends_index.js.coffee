class Recommender.Views.RecommendsIndex extends Backbone.View

  template: JST['recommender/templates/recommends/index']

  events:
    "click .new": "new"

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @add, this)

  add: (model) =>
    view = new Recommender.Views.RecommendsModel({model : model})
    @$("tbody").append(view.render().el)

  new: (e) ->
    view = new Recommender.Views.RecommendsForm
      model: new Recommender.Models.Recommend()
      collection: @collection
      modalTitle: "Add New Recommend"
      modalSubmitButton: "Create Recommend"

    $("#container").append(view.render().el)

    false

  render: ->
    @$el.html(@template(collection: @collection))
    @collection.each(@add)
    this