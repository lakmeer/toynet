
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

export initial = (a) -> a[0 to -2]
export head    = (a) -> if a[0] then that else null
export tail    = (a) -> a[1 to a[*]]
export unwords = (.join " ")
export unlines = (.join "\n")

export zip = (as, bs) ->
  out = []
  for a, ix in as
    b = bs[ix]
    out.push a
    out.push b
  return out

export tuples = (as, bs) ->
  [ [a,bs[ix]] for a,ix in as ]


# DOM

export Q = (sel, scope = document) ->
  if typeof sel isnt \string then sel else scope.query-selector sel

export QSA = (sel, scope = document) ->
  if typeof sel isnt \string then sel else to-array scope.query-selector-all sel

