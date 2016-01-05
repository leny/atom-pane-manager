PaneUtils = require "./pane-utilities.coffee"

_aConfigArrayItems =
    type: "integer"
    minimum: 1
    maximum: 6

module.exports =
    # Configuration settings
    config:
        layoutOne:
            type: "array"
            default: [ 1 ]
            items: _aConfigArrayItems
        layoutTwo:
            type: "array"
            default: [ 1, 1 ]
            items: _aConfigArrayItems
        layoutThree:
            type: "array"
            default: [ 1, 1, 1 ]
            items: _aConfigArrayItems
        layoutFour:
            type: "array"
            default: [ 1, 1, 1, 1 ]
            items: _aConfigArrayItems
        layoutFive:
            type: "array"
            default: [ 2, 2 ]
            items: _aConfigArrayItems
        layoutSix:
            type: "array"
            default: [ 2, 2, 2 ]
            items: _aConfigArrayItems
        layoutSeven:
            type: "array"
            default: [ 1, 2 ]
            items: _aConfigArrayItems
        layoutEight:
            type: "array"
            default: [ 2, 1 ]
            items: _aConfigArrayItems
        layoutNine:
            type: "array"
            default: [ 1, 1, 2 ]
            items: _aConfigArrayItems
        layoutTen:
            type: "array"
            default: [ 1, 2, 2 ]
            items: _aConfigArrayItems

    activate: ->
        # Layout interactions commands
        atom.commands.add "atom-workspace", "pane-manager:change-layout-one", => @changeLayout "layoutOne"
        atom.commands.add "atom-workspace", "pane-manager:change-layout-two", => @changeLayout "layoutTwo"
        atom.commands.add "atom-workspace", "pane-manager:change-layout-three", => @changeLayout "layoutThree"
        atom.commands.add "atom-workspace", "pane-manager:change-layout-four", => @changeLayout "layoutFour"
        atom.commands.add "atom-workspace", "pane-manager:change-layout-five", => @changeLayout "layoutFive"
        atom.commands.add "atom-workspace", "pane-manager:change-layout-six", => @changeLayout "layout6"
        atom.commands.add "atom-workspace", "pane-manager:change-layout-seven", => @changeLayout "layout7"
        atom.commands.add "atom-workspace", "pane-manager:change-layout-eight", => @changeLayout "layout8"
        atom.commands.add "atom-workspace", "pane-manager:change-layout-nine", => @changeLayout "layout9"
        atom.commands.add "atom-workspace", "pane-manager:change-layout-ten", => @changeLayout "layoutTen"

        # Move to pane commands
        atom.commands.add "atom-workspace", "pane-manager:move-to-pane-one", => @moveToPane 1
        atom.commands.add "atom-workspace", "pane-manager:move-to-pane-two", => @moveToPane 2
        atom.commands.add "atom-workspace", "pane-manager:move-to-pane-three", => @moveToPane 3
        atom.commands.add "atom-workspace", "pane-manager:move-to-pane-four", => @moveToPane 4
        atom.commands.add "atom-workspace", "pane-manager:move-to-pane-five", => @moveToPane 5
        atom.commands.add "atom-workspace", "pane-manager:move-to-pane-six", => @moveToPane 6
        atom.commands.add "atom-workspace", "pane-manager:move-to-pane-seven", => @moveToPane 7
        atom.commands.add "atom-workspace", "pane-manager:move-to-pane-eight", => @moveToPane 8
        atom.commands.add "atom-workspace", "pane-manager:move-to-pane-nine", => @moveToPane 9
        atom.commands.add "atom-workspace", "pane-manager:move-to-pane-ten", => @moveToPane 10

        # Focus to pane commands
        atom.commands.add "atom-workspace", "pane-manager:focus-to-pane-one", => @focusToPane 1
        atom.commands.add "atom-workspace", "pane-manager:focus-to-pane-two", => @focusToPane 2
        atom.commands.add "atom-workspace", "pane-manager:focus-to-pane-three", => @focusToPane 3
        atom.commands.add "atom-workspace", "pane-manager:focus-to-pane-four", => @focusToPane 4
        atom.commands.add "atom-workspace", "pane-manager:focus-to-pane-five", => @focusToPane 5
        atom.commands.add "atom-workspace", "pane-manager:focus-to-pane-six", => @focusToPane 6
        atom.commands.add "atom-workspace", "pane-manager:focus-to-pane-seven", => @focusToPane 7
        atom.commands.add "atom-workspace", "pane-manager:focus-to-pane-eight", => @focusToPane 8
        atom.commands.add "atom-workspace", "pane-manager:focus-to-pane-nine", => @focusToPane 9
        atom.commands.add "atom-workspace", "pane-manager:focus-to-pane-ten", => @focusToPane 10

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
