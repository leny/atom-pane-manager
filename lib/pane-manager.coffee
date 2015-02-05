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
        atom.commands.add "atom-workspace", "pane-manager:changeLayoutOne", => @changeLayout "layout1"
        atom.commands.add "atom-workspace", "pane-manager:changeLayoutTwo", => @changeLayout "layout2"
        atom.commands.add "atom-workspace", "pane-manager:changeLayoutThree", => @changeLayout "layout3"
        atom.commands.add "atom-workspace", "pane-manager:changeLayoutFour", => @changeLayout "layout4"
        atom.commands.add "atom-workspace", "pane-manager:changeLayoutFive", => @changeLayout "layout5"
        atom.commands.add "atom-workspace", "pane-manager:changeLayoutSix", => @changeLayout "layout6"
        atom.commands.add "atom-workspace", "pane-manager:changeLayoutSeven", => @changeLayout "layout7"
        atom.commands.add "atom-workspace", "pane-manager:changeLayoutEight", => @changeLayout "layout8"
        atom.commands.add "atom-workspace", "pane-manager:changeLayoutNine", => @changeLayout "layout9"
        atom.commands.add "atom-workspace", "pane-manager:changeLayoutTen", => @changeLayout "layout10"

        # Move to pane commands
        atom.commands.add "atom-workspace", "pane-manager:moveToPaneOne", => @moveToPane 1
        atom.commands.add "atom-workspace", "pane-manager:moveToPaneTwo", => @moveToPane 2
        atom.commands.add "atom-workspace", "pane-manager:moveToPaneThree", => @moveToPane 3
        atom.commands.add "atom-workspace", "pane-manager:moveToPaneFour", => @moveToPane 4
        atom.commands.add "atom-workspace", "pane-manager:moveToPaneFive", => @moveToPane 5
        atom.commands.add "atom-workspace", "pane-manager:moveToPaneSix", => @moveToPane 6
        atom.commands.add "atom-workspace", "pane-manager:moveToPaneSeven", => @moveToPane 7
        atom.commands.add "atom-workspace", "pane-manager:moveToPaneEight", => @moveToPane 8
        atom.commands.add "atom-workspace", "pane-manager:moveToPaneNine", => @moveToPane 9
        atom.commands.add "atom-workspace", "pane-manager:moveToPaneTen", => @moveToPane 10

        # Focus to pane commands
        atom.commands.add "atom-workspace", "pane-manager:focusToPaneOne", => @focusToPane 1
        atom.commands.add "atom-workspace", "pane-manager:focusToPaneTwo", => @focusToPane 2
        atom.commands.add "atom-workspace", "pane-manager:focusToPaneThree", => @focusToPane 3
        atom.commands.add "atom-workspace", "pane-manager:focusToPaneFour", => @focusToPane 4
        atom.commands.add "atom-workspace", "pane-manager:focusToPaneFive", => @focusToPane 5
        atom.commands.add "atom-workspace", "pane-manager:focusToPaneSix", => @focusToPane 6
        atom.commands.add "atom-workspace", "pane-manager:focusToPaneSeven", => @focusToPane 7
        atom.commands.add "atom-workspace", "pane-manager:focusToPaneEight", => @focusToPane 8
        atom.commands.add "atom-workspace", "pane-manager:focusToPaneNine", => @focusToPane 9
        atom.commands.add "atom-workspace", "pane-manager:focusToPaneTen", => @focusToPane 10

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

    moveToPane: ( iTargetPaneIndex = 1 ) ->
        PaneUtils
            .saveActiveItem()
            .moveItemTo ( iTargetPaneIndex - 1 )
            .restoreActiveItem()

    focusToPane: ( iTargetPaneIndex = 1 ) ->
        PaneUtils
            .focusPane ( iTargetPaneIndex - 1 )
