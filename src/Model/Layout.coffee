
module.exports = class Layout
  constructor: ->
    @rightPanelWidth = 400
    @fullScreen = false
    @showAttributesInOutline = true

    @_rightPanelMin = 100
    @_rightPanelMax = 700

  # Note: constraints will be applied before setting the new right-panel width
  setRightPanelWidth: (newWidth) ->
    @rightPanelWidth = Math.min(@_rightPanelMax, Math.max(@_rightPanelMin, newWidth))
    @_refreshLayout()

  toggleFullScreen: ->
    @fullScreen = !@fullScreen
    @_refreshLayout()

  toggleShowAttributesInOutline: ->
    @showAttributesInOutline = !@showAttributesInOutline

  _refreshLayout: ->
    # Changing the layout will deform the canvas
    # This is a workaround by triggering "resize" event so that the Canvas will update itself
    resize = new Event "resize"
    window.dispatchEvent resize
