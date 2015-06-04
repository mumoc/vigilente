window.Vigilente ||= {}

class Vigilente.Crimes
  constructor: ->
    @$list = arguments[0].list
    @crimeClass = arguments[0].crimeClass
    @moreClass = arguments[0].moreClass
    @closeClass = arguments[0].closeClass
    @bindActions()

  bindActions: =>
    @showCrime()
    @closeCrime()

  showCrime: ->
    @$list.on 'click', @moreClass, (el) =>
      @closeAll()
      @toggleCrime ($ el.currentTarget)
      false

  closeCrime: ->
    @$list.on 'click', @closeClass, (el) =>
      @toggleCrime ($ el.currentTarget, true)
      false

  closeAll: ->
    @$list.
      find(@crimeClass).
      removeClass 'active'

  toggleCrime: ($trigger, toggle = false) ->
    crime = $trigger.parents '.js-crime'
    display = toggle || !crime.hasClass('active')
    crime.
      toggleClass 'active', display

