window.Vigilente ||= {}

class Vigilente.Popup
  constructor: (args) ->
    @$popup = args['popup']
    @$triggers = args['triggers']
    @bindActions()

  bindActions: ->
    @$triggers.on 'click', =>
      display = !@$popup.hasClass('active')
      @toggle display

  toggle: (display) ->
    @$popup.toggleClass 'active', display

