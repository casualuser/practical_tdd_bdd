whatever = require('../src/whatever.coffee')
chai     = require('chai')

chai.should()

array = []
add = (key, value) ->
  array.push(key: key, value: value)
whatevered = whatever(add)

describe 'whatevered function', ->

  beforeEach -> array = []

  it 'should accept 2 arguments and call original function once', ->
    whatevered('awe', 'some')
    array[0].should.eql(key: 'awe', value: 'some')

  it 'should accept object as argument and call original function for each key', ->
    whatevered(one: 1, two: 2)
    array[0].should.eql(key: 'one', value: 1)
    array[1].should.eql(key: 'two', value: 2)

  it 'should apply passed context to original function', ->
    obj =
      array: []
      add: (key, value) ->
        @array.push(key: key, value: value)
    whatevered = whatever(obj.add, obj)
    whatevered('lol', 'w00t')
    obj.array[0].should.eql(key: 'lol', value: 'w00t')
