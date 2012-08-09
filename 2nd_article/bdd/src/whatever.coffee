whatever = (fn, context) ->
  whatevered = (possibleKey, possibleValue) ->
    if typeof possibleKey == 'object'
      whatevered(key, value) for key, value of possibleKey
    else
      fn.call(context, possibleKey, possibleValue)

if window?
  window.whatever = whatever
else
  module.exports = whatever