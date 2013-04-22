class Recommender.Views.RecommendsShow extends Backbone.View

  template: JST['recommender/templates/recommends/show']
  resources_template: JST['recommender/templates/recommends/show_resources']
  choice_template: JST['recommender/templates/recommends/show_choice']

  events:
    "click .next": "next_page"
    "click .pre": "pre_page"

  initialize: (options) ->
    @resource_collection = @model.resources()
    @page = 0
    @choices = []
    @model.on('change:title', @updateTitle, this)
    @resource_collection.on('reset', @resources, this)

  next_page: (e) ->
    @page += 1
    resource_id = $(e.currentTarget).data("id")
    @choices.push resource_id if resource_id
    if @page < @page_total
      @resources()
    else
      $.post "#{_.result(@model, 'url')}/choice", choices: @choices, (data) =>
        product = new Recommender.Models.Product(data)
        @$("#resources").html(@choice_template(product: product))
        
    false

  pre_page: (e) ->
    @page -= 1
    @resources()

    false

  updateTitle: ->
    @$("#title").text(@model.get 'title')

  resources: ->
    @page_total ||= @resource_collection.length / 2
    resources = @resource_collection.slice(@page*2, @page*2+2)
    @$("#resources").html(@resources_template(resources: resources, page_total: @page_total, page: @page))
    this

  render: ->
    @$el.html(@template(model: @model))
    this