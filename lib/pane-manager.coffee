PaneUtils = require "./pane-utilities.coffee"

_aConfigArrayItems =
    type: "integer"
    minimum: 1
    maximum: 6

module.exports =
    # Configuration settings
    config:
        layout1:
            type: "array"
            default: [ 1 ]
            items: _aConfigArrayItems
        layout2:
            type: "array"
            default: [ 1, 1 ]
            items: _aConfigArrayItems
        layout3:
            type: "array"
            default: [ 1, 1, 1 ]
            items: _aConfigArrayItems
        layout4:
            type: "array"
            default: [ 1, 1, 1, 1 ]
            items: _aConfigArrayItems
        layout5:
            type: "array"
            default: [ 2, 2 ]
            items: _aConfigArrayItems
        layout6:
            type: "array"
            default: [ 2, 2, 2 ]
            items: _aConfigArrayItems
        layout7:
            type: "array"
            default: [ 1, 2 ]
            items: _aConfigArrayItems
        layout8:
            type: "array"
            default: [ 2, 1 ]
            items: _aConfigArrayItems
        layout9:
            type: "array"
            default: [ 1, 1, 2 ]
            items: _aConfigArrayItems
        layout10:
            type: "array"
            default: [ 1, 2, 2 ]
            items: _aConfigArrayItems

    activate: ->
        # Layout interactions commands
        atom.workspaceView.command "pane-manager:changeLayoutOne", => @changeLayout "layout1"
        atom.workspaceView.command "pane-manager:changeLayoutTwo", => @changeLayout "layout2"
        atom.workspaceView.command "pane-manager:changeLayoutThree", => @changeLayout "layout3"
        atom.workspaceView.command "pane-manager:changeLayoutFour", => @changeLayout "layout4"
        atom.workspaceView.command "pane-manager:changeLayoutFive", => @changeLayout "layout5"
        atom.workspaceView.command "pane-manager:changeLayoutSix", => @changeLayout "layout6"
        atom.workspaceView.command "pane-manager:changeLayoutSeven", => @changeLayout "layout7"
        atom.workspaceView.command "pane-manager:changeLayoutEight", => @changeLayout "layout8"
        atom.workspaceView.command "pane-manager:changeLayoutNine", => @changeLayout "layout9"
        atom.workspaceView.command "pane-manager:changeLayoutTen", => @changeLayout "layout10"

    changeLayout: ( sLayout ) ->
        unless aLayoutConfig = atom.config.get "pane-manager.#{ sLayout }"
            return console.error "Unknown layout '#{ sLayout }'!"
        PaneUtils
            .saveActiveItem()
            .saveItems()
            .clearPanes()
            .applyLayout aLayoutConfig
            .restoreItems()
            .restoreActiveItem()
