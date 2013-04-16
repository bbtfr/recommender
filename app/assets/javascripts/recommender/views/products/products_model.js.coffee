class Recommender.Views.ProductsModel extends Backbone.View

  template: JST['recommender/templates/products/model']

  events:
    "click .destroy" : "destroy"
    "save": "save"

  tagName: "tr"

  initialize: ->
    @model.on("reset", @render, this)

  save: ->
    attrs = {}
    @$("td").each (i, td) ->
      $td = $(td)
      if key = $td.data("key")
        if subkey = $td.data("subkey")
          attrs[key] ||= {}
          attrs[key][subkey] = $td.text()
        else
          attrs[key] = $td.text()
    @model.save attrs

  destroy: (e) ->
    @model.destroy()
    @remove()

    false

  render: ->
    @$el.html(@template(collection: @collection, model: @model))
    this
