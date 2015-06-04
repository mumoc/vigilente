window.Vigilente ||= {}

class Vigilente.SlideMenu
  constructor: ->
    @$menu = arguments[0].menu
    @$triggers = arguments[0].triggers
    @bindActions()

  bindActions: ->
    @$triggers.on 'click', =>
      display = !@$menu.hasClass('active')
      @toggle display
      false

  toggle: (display) ->
    @$menu.toggleClass 'active', display

