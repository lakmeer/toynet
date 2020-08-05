
# General

export id   = -> it
export log  = -> console.log ...; &0
export warn = -> console.warn ...; &0


# Functional

export invoke = (λ, ...args) -> λ ...args


# Numbers

export wrap = (a, b, n) --> if n < a then b else if n > b then a else n


# Strings

export pad = (l, n) --> if n.length < l then (([ '0' ] * (l - n.length)).join '') + n else n


# Arrays

export to-array = (alo) -> Array::slice.apply alo

export unlines = (.join "\n")

export zip = (as, bs) ->
  out = []
  for a, ix in as
    b = bs[ix]
    out.push a
    out.push b
  return out


# DOM

export Q = (sel, scope = document) ->
  if typeof sel isnt \string then sel else scope.query-selector sel

export QSA = (sel, scope = document) ->
  if typeof sel isnt \string then sel else to-array scope.query-selector-all sel

