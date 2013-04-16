class Recommender.Views.RecommendsForm extends Backbone.View

  template: JST['recommender/templates/recommends/form']
  dynamic_field_template: JST['recommender/templates/recommends/dynamic_field']
  errors_template: JST['recommender/templates/errors']

  className: "modal fade"

  events:
    "hidden": "destroy"
    "submit form": "submit"
    "click .new_dynamic_field": "new_dynamic_field"
    "click .remove_dynamic_field": "remove_dynamic_field"

  new_dynamic_field: (e, dynamic_field) ->
    @$("#dynamic_fields").append(@dynamic_field_template(dynamic_field: dynamic_field))
    
    false

  remove_dynamic_field: (e) ->
    index = @$("#dynamic_fields .remove_dynamic_field").index(e.target)
    @$("#dynamic_fields .input-append").eq(index).remove()

    false

  submit: (e) ->
    submitOptions =
      success: (@model) =>
        @$el.modal("hide")

    attrs = @$("form").serializeObject()
    errors = Recommender.Models.Recommend::validate attrs
    unless errors
      if @model.isNew()
        @collection.create attrs, submitOptions
      else
        @model.save attrs, submitOptions
    else
      @$("#errors").html(@errors_template(errors: errors))

    false

  destroy: ->
    @remove()

    false

  render: ->
    @$el.html(@template(model: @model))
    @$("#modal-title").text(@options.modalTitle)
    @$("#modal-submit-button").text(@options.modalSubmitButton)
    for dynamic_field in (@model.get 'dynamic_fields') || []
      @new_dynamic_field null, (dynamic_field || [])
    @$el.modal("show")
    this