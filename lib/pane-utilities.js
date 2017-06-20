"use babel";

let oPaneUtilities,
    fGetCenterPanes,
    fGetPaneAt;

fGetCenterPanes = function() {
    return atom.workspace.getCenter().getPanes();
};

fGetPaneAt = function( iPaneIndex ) {
    let aPanes = fGetCenterPanes();

    return aPanes[ iPaneIndex ] || aPanes[ aPanes.length - 1 ];
};

oPaneUtilities = {
    clearPanes() {
        let aPanes;

        while ( ( aPanes = fGetCenterPanes() ).length > 1 ) {
            aPanes[ aPanes.length - 1 ].destroy();
        }

        return this;
    },
    saveActiveItem() {
        let oActivePaneItem = atom.workspace.getActivePaneItem();

        this._sCurrentActiveURI = oActivePaneItem && oActivePaneItem.getURI && oActivePaneItem.getURI();

        return this;
    },
    saveItems() {
        let oFirstPane = fGetPaneAt( 0 );

        fGetCenterPanes().forEach( ( oPane, iPaneIndex ) => {
            for ( let oItem of oPane.getItems() ) {
                oItem.originalPaneIndex = iPaneIndex;
                if ( iPaneIndex > 0 ) {
                    oPane.moveItemToPane( oItem, oFirstPane, oFirstPane.getItems().length );
                }
            }
        } );

        return this;
    },
    restoreActiveItem() {
        if ( this._sCurrentActiveURI ) {
            let oActivePane = atom.workspace.paneForURI( this._sCurrentActiveURI );

            oActivePane.activate();
            oActivePane.activateItemForURI( this._sCurrentActiveURI );
            this._sCurrentActiveURI = null;
        }

        return this;
    },
    restoreItems() {
        let oFirstPane = fGetPaneAt( 0 );

        for ( let oItem of oFirstPane.getItems() ) {
            let oTargetPane = fGetPaneAt( oItem.originalPaneIndex );

            if ( oItem.originalPaneIndex > 0 ) {
                oFirstPane.moveItemToPane( oItem, oTargetPane, oTargetPane.getItems().length );
            }
        }

        return this;
    },
    moveItemTo( iTargetPaneIndex ) {
        let oTargetPane = fGetPaneAt( iTargetPaneIndex ),
            oCurrentPane = atom.workspace.getActivePane(),
            oActiveItem = oCurrentPane.getActiveItem();

        if ( oActiveItem != null ) {
            oCurrentPane.moveItemToPane( oActiveItem, oTargetPane, oTargetPane.getItems().length );
            // Give focus to moved pane (thanks to JD342)
            oTargetPane.activate();
            oTargetPane.activateItem( oActiveItem );
        }

        return this;
    },
    focusPane( iTargetPaneIndex ) {
        fGetPaneAt( iTargetPaneIndex ).activate();

        return this;
    },
    applyLayout( aLayout ) {
        let oPanes = fGetCenterPanes(),
            iHorizontalDivisions;

        // divide columns
        iHorizontalDivisions = aLayout.length - 1;
        while ( --iHorizontalDivisions >= 0 ) {
            oPanes[ 0 ].splitRight();
        }

        // divide rows
        oPanes = fGetCenterPanes();
        aLayout.forEach( ( iRows, iIndex ) => {
            let iVerticalDivisions = iRows - 1;

            while ( --iVerticalDivisions >= 0 ) {
                oPanes[ iIndex ].splitDown();
            }
        } );

        return this;
    }
};

export default oPaneUtilities;
