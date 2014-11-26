$ ->
  $('form').submit (e) ->
    e.preventDefault()

    twitterHandles = for twitterHandle in $(@).find('textarea').val().split(',')
      $.trim(twitterHandle)

    groups = Teaminator.groupRandomly(twitterHandles)

    groupsHTML = for group in groups
      groupHTML = for person in group
        "<li>#{person}</li>"
      "<li><ul>#{groupHTML.join('')}</ul></li>"

    $('#result').html("<ul>#{groupsHTML.join('')}</ul>")
