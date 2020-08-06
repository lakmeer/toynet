
{ log } = require \utils

series-color = <[ red lightblue limegreen yellow orange ]>


#
# Plot
#
# Quick n dirty way to plot functions to check for implementation errors
#

module.exports = Plot = (m, n) ->

  canvas = document.create-element \canvas
  ctx    = canvas.get-context \2d

  canvas.width = canvas.height = 500
  ctx.fill-rect 0, 0, canvas.width, canvas.height

  w = canvas.width /2
  h = canvas.height/2

  document.body.append-child canvas


  # Interface

  plot: (ƒ) ->
    ctx.stroke-style = \white
    ctx.begin-path!

    ctx.move-to 0, h
    ctx.line-to w*2, h
    ctx.move-to w, 0
    ctx.line-to w, h*2
    ctx.stroke!

    ctx.stroke-style = \red
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

  series: (data) ->
    ctx.stroke-style = \white
    ctx.begin-path!

    ctx.move-to 0, h
    ctx.line-to w*2, h
    ctx.move-to w, 0
    ctx.line-to w, h*2
    ctx.stroke!

    log data

    for series, ix in data
      ctx.stroke-style = series-color[ix]
      ctx.begin-path!

      for y,i in series
        px = i/series.length
        x = m + (n - m) * px
        py = y / (n - m) * (n - m)

        if i is 0
          ctx.move-to px * w*2, h - py * h
        else
          ctx.line-to px * w*2, h - py * h

      ctx.stroke!

