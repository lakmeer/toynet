
# Require

{ id, log, initial, tail, zip, tuples, Q } = require \utils
{ add, sub, dot, sum, matmul, matadd, sigmoid, relu, matrix, stringify-matrix, rand-sd } = require \math

GUI = require \dat.gui
Plot = require \./plot


# Main Program

document.add-event-listener \DOMContentLoaded, ->

  log "ToyNet::init - ok"


  # NNFS model

  new-layer = (input-size, output-size) ->
    weights: matrix [ input-size, output-size ], rand-sd
    biases:  [ 0 for til output-size ]

  compute-layer = (input-batch, { weights, biases }, activation) ->
    for inputs in input-batch
      (weights.map (`dot` inputs)) `add` biases |> (.map activation)

  new-network = (layer-sizes, activation = id) ->
    activation: activation
    layers:
      for [ in-size, out-size ] in tuples (initial layer-sizes), (tail layer-sizes)
        new-layer in-size, out-size

  compute-network = (inputs, nn) ->
    for layer,ix in nn.layers
      inputs := compute-layer inputs, layer, nn.activation
    inputs


  # TEST

  nn = new-network [1 8 8 1], relu


  inputs = [ [ Math.sin x ] for x from 0 to 6 by 0.1 ]
  output = compute-network inputs, nn

  plot = Plot -6, 6
  plot.series [ inputs, output ]

  error = sum (inputs `sub` output)

  log error




