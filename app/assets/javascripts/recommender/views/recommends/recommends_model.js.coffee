class Recommender.Views.RecommendsModel extends Backbone.View

  template: JST['recommender/templates/recommends/model']

  events:
    "click .edit" : "edit"
    "click .destroy" : "destroy"

  tagName: "tr"

  initialize: ->
    @model.on("change reset", @render, this)
    
  edit: (e) ->
    view = new Recommender.Views.RecommendsForm
      model: @model
      modalTitle: "Edit Recommend #{@model.id}"
      modalSubmitButton: "Update Recommend"

    $("#container").append(view.render().el)

    false

  destroy: (e) ->
    @model.destroy()
    @remove()

    false

  render: ->
    @$el.html(@template(model: @model))
    this
