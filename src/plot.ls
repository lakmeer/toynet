
{ log } = require \utils


#
# Plot
#
# Quick n dirty way to plot functions to check for implementation errors
#

module.exports = Plot = (m, n) ->

  canvas = document.create-element \canvas
  ctx    = canvas.get-context \2d

  canvas.width = canvas.height = 500

  w = canvas.width /2
  h = canvas.height/2

  document.body.append-child canvas


  # Interface

  plot: (ƒ) ->
    ctx.fill-rect 0, 0, canvas.width, canvas.height

    ctx.stroke-style = \red
    ctx.begin-path!

    ctx.move-to 0, h
    ctx.line-to w*2, h
    ctx.move-to w, 0
    ctx.line-to w, h*2
    ctx.stroke!

    ctx.stroke-style = \white
    ctx.begin-path!

    for i from 0 to canvas.width
      px = i/canvas.width
      x = m + (n - m) * px
      y = ƒ x
      py = y / (n - m)

      if i is 0
        ctx.move-to px * w*2, h - py * h
      else
        ctx.line-to px * w*2, h - py * h

    ctx.stroke!

