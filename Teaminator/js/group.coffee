isIdealSize = (people, maxSize) ->
  groups = people.chunk(maxSize)
  (groups[0].length - groups[groups.length - 1].length) <= 1

Teaminator =
  group: (people) ->
    maxSize = 5
    i = maxSize

    while i >= 0
      return people.chunk(i) if isIdealSize(people, i)
      i--

  groupRandomly: (people) ->
    Teaminator.group(people.shuffle())

Array::chunk = (chunkSize) ->
  array = this
  [].concat.apply [], array.map((elem, i) ->
    (if i % chunkSize then [] else [array.slice(i, i + chunkSize)])
  )

Array::shuffle = ->
  currentIndex = this.length
  temporaryValue = undefined
  randomIndex = undefined

  while 0 isnt currentIndex
    randomIndex = Math.floor(Math.random() * currentIndex)
    currentIndex -= 1

    temporaryValue = this[currentIndex]
    this[currentIndex] = this[randomIndex]
    this[randomIndex] = temporaryValue

  return this