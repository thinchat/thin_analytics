class @Graph
  constructor: (@title, @container, @firstName, @firstMarker, @firstColor, @secondName, @secondMarker, @secondColor, @interval, @guests, @agents, @updateFirstCount, @updateSecondCount) ->

  draw: ->
    updateFirstCount = @updateFirstCount
    updateSecondCount = @updateSecondCount

    new Highcharts.Chart(
      chart:
        renderTo: @container
        defaultSeriesType: "spline"
        marginRight: 10
        events:
          load: ->
            series = @series[0]
            console.log(series)
            setInterval (->
              x = (new Date()).getTime()
              y = updateFirstCount()
              series.addPoint [ x, y ], true, true
            ), 2000
            series2 = @series[1]
            setInterval (->
              x = (new Date()).getTime()
              y = updateSecondCount()
              series2.addPoint [ x, y ], true, true
            ), 2000

      title:
        text: @title
        style:
          margin: "10px 100px 0 0"

      colors: [
        @firstColor,
        @secondColor
      ]

      xAxis:
        type: "datetime"
        tickPixelInterval: @interval

      yAxis:
        title:
          text: "Count"

      plotLines: [
        value: 0
        width: 1
        color: "#808080"
      ]

      tooltip:
        formatter: ->
          "<b>" + @series.name + "</b><br/>" + Highcharts.dateFormat("%Y-%m-%d %H:%M:%S", @x) + "<br/>" + Highcharts.numberFormat(@y, 2)

      legend:
        enabled: true

      exporting:
        enabled: false

      plotOptions:
        spline:
          marker: {
            radius: 3,
            lineColor: '#333',
            lineWidth: 1
          }
          dataLabels:
            enabled: false
            formatter: ->
              @series.inc = 1  unless @series.inc
              if @series.inc >= parseInt(@series.data.length)
                @series.inc = 0
                return @point.y
              @series.inc++

      series: [{
          name: @firstName,
          marker: {
            symbol: @firstMarker
          },
          data: @guests
        }, {
          name: @secondName,
          marker: {
            symbol: @secondMarker
          },
          data: @agents
        }
      ]
    )
