(($, document, Pace) ->
  $(document).on "page:fetch", ->
    Pace.start()

  $(document).on "page:change", ->
    Pace.stop()

  $(document).on "page:restore", ->
    Pace.stop()
) jQuery, document, Pace
