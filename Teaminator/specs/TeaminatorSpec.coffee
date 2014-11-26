describe 'Teaminator', ->
  {group, groupRandomly} = Teaminator

  describe '.group', ->
    describe 'when given eight people', ->
      people = [
        'emile'
        'seb'
        'luke'
        'matt'
        'fareed'
        'scoot'
        'chris'
        'rory'
      ]

      groups = group(people)
      it 'should return two groups', ->
        expect(groups.length).toEqual 2

      it 'should return groups of four', ->
        $.each groups, (i) ->
          expect(groups[i].length).toEqual 4

    describe 'when given nine people', ->
      people = [
        'emile'
        'seb'
        'luke'
        'matt'
        'fareed'
        'scoot'
        'chris'
        'rory'
        'jeff'
      ]
      groups = group(people)
      it 'should return two groups', ->
        expect(groups.length).toEqual 2

      it 'should return first group with five people', ->
        expect(groups[0].length).toEqual 5

      it 'should return second group with four people', ->
        expect(groups[1].length).toEqual 4


    describe 'when given eleven people', ->
      people = [
        'emile'
        'seb'
        'luke'
        'matt'
        'fareed'
        'scoot'
        'chris'
        'rory'
        'jeff'
        'bob'
        'dean'
      ]
      groups = group(people)
      it 'should return three groups', ->
        expect(groups.length).toEqual 3

      it 'should return first group with four people', ->
        expect(groups[0].length).toEqual 4

      it 'should return second group with four people', ->
        expect(groups[1].length).toEqual 4

      it 'should return third group with three people', ->
        expect(groups[2].length).toEqual 3

  describe '.groupRandomly', ->
    people = [
      'emile'
      'seb'
      'luke'
      'matt'
      'fareed'
      'scoot'
      'chris'
      'rory'
      'jeff'
    ]

    it 'should not return the same groups on subsequent calls', ->
      first_group = groupRandomly(people)
      second_group = groupRandomly(people)
      expect(first_group).not.toEqual(second_group)
