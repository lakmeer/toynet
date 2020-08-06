
# Imports
{ log, unwords, unlines } = require \utils
{ sqrt, log:ln, exp, sin, cos, random, PI, min, max } = Math

# Constants
export const TAU = PI * 2


#
# Math helpers
#

# Randomisers

export rand       = (n) -> n * random!
export rand-sd    = -> (sqrt -2 * ln rand 1) * (cos rand TAU)
export rand-range = (a, b) -> a + (b - a) * random!


# Linear

export sum = (.reduce (+), 0)
export sigmoid = (x) -> 1/(1 + exp -x)
export relu = (x) -> max(0, x)


# Vectors


# Matrices

export matrix = ([ w, h ], v = -> 0) -> [ [ v! for til w ] for til h ]
export stringify-matrix = (m) -> '\n[' + ((m.map (.map (.toFixed 3)) .map unwords).join '\n ') + ']'

export matmul = (a, b) ->

  log "MATMUL: " + a.length + 'x' + a[0].length + ", " + b.length + "x" + b[0].length

  result = []

  for x,i in a
    result[i] = []
    for y,j in b[0]
      sum = 0
      for z,k in a[0]
        sum += a[i][k] * b[k][j]
      result[i][j] = sum

  result

export matadd = (a, b) ->
  log a, b

  result = []

  for x,i in a
    result[i] = []
    for y,j in a[i]
      result[i].push a[i][j] + b[i][j]

  result

export dot = (xs, ys) ->
  if (xs.length isnt ys.length)
    console.warn "Math::dot - lengths must be the same"
    return 0
  sum [ x + ys[i] for x,i in xs ]

export add = (xs, ys) ->
  if (xs.length isnt ys.length)
    console.warn "Math::add - lengths must be the same"
    return 0
  [ x + ys[i] for x,i in xs ]

export sub = (xs, ys) ->
  if (xs.length isnt ys.length)
    console.warn "Math::sub - lengths must be the same"
    return 0
  [ x - ys[i] for x,i in xs ]


