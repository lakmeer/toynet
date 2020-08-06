
# Imports
{ log, unwords, unlines } = require \utils
{ sqrt, log:ln, exp, sin, cos, random, PI } = Math

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

export sigmoid = (x) -> 1/(1 + exp -x)


# Vectors


# Matrices

export matrix = ([ w, h ], v = -> 0) -> [ [ v! for til w ] for til h ]
export stringify-matrix = (m) -> '[' + ((m.map unwords).join '\n ') + ']'

export matmul = (a, b) ->
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




