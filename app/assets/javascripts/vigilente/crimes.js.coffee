window.Vigilente ||= {}

class Vigilente.Crimes
  constructor: ->
    @$list = arguments[0].list
    @bindActions()

  bindActions: =>
    @showCrime()
    @closeCrime()
    @showBigImage()
    @closeBigImage()

  showCrime: ->
    @$list.on 'click', '.js-crime-more', (el) =>
      @closeAll()
      @toggleCrime ($ el.currentTarget)
      false

  closeCrime: ->
    @$list.on 'click', '.js-crime-close', (el) =>
      @toggleCrime ($ el.currentTarget, true)
      false

  showBigImage: ->
    ($ '.js-crime').on 'click', '.reports-crime-images img', (el) =>
      image = ($ el.currentTarget)
      crime = ($ image.parents('.js-crime'))
      @toggleBigImage(crime, image.clone()) if crime.hasClass('active')
      false

  closeBigImage: ->
    ($ '.js-big-image').on 'click', '.js-big-image-close', (el) =>
      crime = ($ el.delegateTarget)
      crime.removeClass('active').
        find('.reports-crime-image').remove()
      false

  closeAll: ->
    @$list.
      find('.js-crime, .js-big-image').
      removeClass 'active'

  toggleCrime: ($trigger, toggle = false) =>
    crime = $trigger.parents '.js-crime'
    display = toggle || !crime.hasClass('active')
    crime.
      toggleClass 'active', display

  toggleBigImage: ($crime, $image) ->
    $crime.
      find('.js-big-image-container').
      find('.reports-crime-image').
      remove('').end().
      append($image).end().
      find('.js-big-image').
      addClass 'active'
