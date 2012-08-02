whatever = require('../src/whatever.coffee')
assert   = require('assert')

array = []
add = (key, value) ->
  array.push(key: key, value: value)
whatevered = whatever(add)

setup -> array = []

suite 'whatevered function', ->

test 'call with 2 arguments', ->
  whatevered('awe', 'some')
  assert(array[0].key,   'awe')
  assert(array[0].value, 'some')

test 'call with collection of pairs', ->
  whatevered(one: 1, two: 2)
  assert(array[0].key,   'one')
  assert(array[0].value, 1)
  assert(array[1].key,   'two')
  assert(array[1].value, 2)


