window.Vigilente ||= {}

class Vigilente.Popup
  constructor: ->
    @$popup = arguments[0].popup
    @$triggers = arguments[0].triggers
    @bindActions()

  bindActions: ->
    @$triggers.on 'click', =>
      display = !@$popup.hasClass('active')
      @toggle display

  toggle: (display) ->
    @$popup.toggleClass 'active', display

