class @Graph
  constructor: (@title, @container, @interval, @data, @updateCount) ->

  draw: ->
    updateCount = @updateCount
    new Highcharts.Chart(
      chart:
        renderTo: @container
        defaultSeriesType: "spline"
        marginRight: 10
        events:
          load: ->
            series = @series[0]
            setInterval (->
              x = (new Date()).getTime()
              y = updateCount()
              series.addPoint [ x, y ], true, true
            ), 1000

      title:
        text: @title
        style:
          margin: "10px 100px 0 0"

      xAxis:
        type: "datetime"
        tickPixelInterval: @interval

      yAxis:
        title:
          text: "Value"

      plotLines: [
        value: 0
        width: 1
        color: "#808080"
      ]

      tooltip:
        formatter: ->
          "<b>" + @series.name + "</b><br/>" + Highcharts.dateFormat("%Y-%m-%d %H:%M:%S", @x) + "<br/>" + Highcharts.numberFormat(@y, 2)

      legend:
        enabled: false

      exporting:
        enabled: false

      plotOptions:
        spline:
          dataLabels:
            enabled: true
            formatter: ->
              @series.inc = 1  unless @series.inc
              if @series.inc >= parseInt(@series.data.length)
                @series.inc = 0
                return @point.y
              @series.inc++

      series: [
        name: "Random data"
        data: @data
      ]
    )
