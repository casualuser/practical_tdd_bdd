whatever = (fn) ->
  (possibleKey, possibleValue) ->
    if typeof possibleKey == 'object'
      for key, value of possibleKey
        fn(key, value)
    else
      fn(possibleKey, possibleValue)

if window?
  window.whatever = whatever
else
  module.exports = whatever