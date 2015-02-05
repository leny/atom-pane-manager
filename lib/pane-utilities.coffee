# PaneUtilities

module.exports = class PaneUtilities

    _sCurrentActiveURI = null

    @clearPanes = ->
        while ( aPanes = _getCurrentPanes() ).length > 1
            aPanes[ aPanes.length - 1 ].destroy()

        return PaneUtilities

    @saveActiveItem = ->
        _sCurrentActiveURI = atom.workspace.getActivePaneItem()?.getUri?()

        return PaneUtilities

    @saveItems = ->
        oFirstPane = _getPaneAt 0

        for oPane, iPaneIndex in _getCurrentPanes()
            for oItem in oPane.getItems()
                oItem.originalPaneIndex = iPaneIndex
                if iPaneIndex > 0
                    iItemsLength = oFirstPane.getItems().length
                    oPane.moveItemToPane oItem, oFirstPane, iItemsLength

        return PaneUtilities

    @restoreActiveItem = ->
        if _sCurrentActiveURI
            ( oActivePane = atom.workspace.paneForUri _sCurrentActiveURI ).activate()
            oActivePane.activateItemForUri _sCurrentActiveURI
            _sCurrentActiveURI = null

        return PaneUtilities

    @restoreItems = ->
        oFirstPane = ( aPanes = _getCurrentPanes() )[ 0 ]

        for oItem in oFirstPane.getItems()
            oTargetPane = _getPaneAt oItem.originalPaneIndex
            if oItem.originalPaneIndex > 0
                iItemsLength = oTargetPane.getItems().length
                oFirstPane.moveItemToPane oItem, oTargetPane, iItemsLength

        return PaneUtilities

    @moveItemTo = ( iTargetPaneIndex ) ->
        oTargetPane = _getPaneAt iTargetPaneIndex
        iItemsLength = oTargetPane.getItems().length

        ( oCurrentPane = atom.workspace.getActivePane() )
            .moveItemToPane oCurrentPane.getActiveItem(), oTargetPane, iItemsLength

        return PaneUtilities

    @focusPane = ( iTargetPaneIndex ) ->
        _getPaneAt( iTargetPaneIndex ).activate()

        return PaneUtilities

    @applyLayout = ( aLayout ) ->
        oPanes = _getCurrentPanes()

        # Divide columns
        for i in [ 0 ... ( aLayout.length - 1 ) ]
            oPanes[ 0 ].splitRight()

        # Divide rows
        oPanes = _getCurrentPanes()
        for iRows, iIndex in aLayout
            for i in [ 0 ... ( iRows - 1 ) ]
                oPanes[ iIndex ].splitDown()

        return PaneUtilities

    _getCurrentPanes = ->
        ( oPane for oPane in atom.workspace.getPanes() )

    _getPaneAt = ( iPaneIndex ) ->
        ( aPanes = _getCurrentPanes() )[ iPaneIndex ] ? aPanes[ aPanes.length - 1 ]
