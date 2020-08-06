
# Require

{ id, log, initial, tail, zip, tuples, Q } = require \utils
{ matmul, matadd, sigmoid, matrix, stringify-matrix, rand-sd } = require \math

GUI = require \dat.gui


# Net model

net = do
  layer-sizes   = [3,5,10]
  weight-shapes = tuples (initial layer-sizes), (tail layer-sizes)

  weights = [ matrix w, rand-sd for w in weight-shapes ]
  biases  = [ matrix [h, 1] for h in tail layer-sizes ]

  activation = sigmoid

  predict = (a) ->
    log "Net::predict - inputs:", a

    for w,ix in weights
      b = biases[ix]
      a := ((w `matmul` a) `matadd` b).map activation
      log a
      log "Net::predict - layer:", stringify-matrix a

    log "Net::predict - prediction:", stringify-matrix a


  { predict }





# Main Program

document.add-event-listener \DOMContentLoaded, ->

  log "ToyNet::init - ok"


  net.predict [ 1 for from 1 to 10 ]
