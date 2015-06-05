window.Vigilente ||= {}

class Vigilente.Crimes
  constructor: ->
    @$list = arguments[0].list
    @bindActions()

  bindActions: =>
    @showCrime()
    @closeCrime()
    @preventImageActions()

  showCrime: ->
    @$list.on 'click', '.js-crime-more', (el) =>
      @createSlider ($ el.currentTarget)
      @closeAll()
      @toggleCrime ($ el.currentTarget)
      false

  closeCrime: ->
    @$list.on 'click', '.js-crime-close', (el) =>
      @toggleCrime ($ el.currentTarget, true)
      false

  closeAll: ->
    @$list.
      find('.js-crime').
      removeClass 'active'

  toggleCrime: ($trigger, toggle = false) =>
    crime = $trigger.parents '.js-crime'
    display = toggle || !crime.hasClass('active')
    crime.
      toggleClass 'active', display

  createSlider: ($trigger) ->
    crime = $trigger.parents '.js-crime'
    crime.find('.reports-crime-images a').tosrus()

  preventImageActions: ->
    @$list.on 'click', '.js-crime-image', -> false
