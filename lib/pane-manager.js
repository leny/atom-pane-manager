"use babel";

import { CompositeDisposable } from "atom";
import PaneUtils from "./pane-utilities";

let oConfigArrayItems = {
        "type": "integer",
        "minimum": 1,
        "maximum": 6
    },
    oPackageConfig, fActivate, fDeactivate, oDisposables,
    fChangeLayout, fMoveToPane, fFocusToPane;

oPackageConfig = {
    "layout-one": {
        "type": "array",
        "default": [ 1 ],
        "items": oConfigArrayItems
    },
    "layout-two": {
        "type": "array",
        "default": [ 1, 1 ],
        "items": oConfigArrayItems
    },
    "layout-three": {
        "type": "array",
        "default": [ 1, 1, 1 ],
        "items": oConfigArrayItems
    },
    "layout-four": {
        "type": "array",
        "default": [ 1, 1, 1, 1 ],
        "items": oConfigArrayItems
    },
    "layout-five": {
        "type": "array",
        "default": [ 2, 2 ],
        "items": oConfigArrayItems
    },
    "layout-six": {
        "type": "array",
        "default": [ 2, 2, 2 ],
        "items": oConfigArrayItems
    },
    "layout-seven": {
        "type": "array",
        "default": [ 1, 2 ],
        "items": oConfigArrayItems
    },
    "layout-eight": {
        "type": "array",
        "default": [ 2, 1 ],
        "items": oConfigArrayItems
    },
    "layout-nine": {
        "type": "array",
        "default": [ 1, 1, 2 ],
        "items": oConfigArrayItems
    },
    "layout-ten": {
        "type": "array",
        "default": [ 1, 2, 2 ],
        "items": oConfigArrayItems
    }
};

fActivate = function() {
    oDisposables && oDisposables.dispose();
    oDisposables = new CompositeDisposable();

    // Change layout
    oDisposables.add( atom.commands.add( "atom-workspace", {
        "pane-manager:change-layout-one": fChangeLayout.bind( null, "layout-one" ),
        "pane-manager:change-layout-two": fChangeLayout.bind( null, "layout-two" ),
        "pane-manager:change-layout-three": fChangeLayout.bind( null, "layout-three" ),
        "pane-manager:change-layout-four": fChangeLayout.bind( null, "layout-four" ),
        "pane-manager:change-layout-five": fChangeLayout.bind( null, "layout-five" ),
        "pane-manager:change-layout-six": fChangeLayout.bind( null, "layout-six" ),
        "pane-manager:change-layout-seven": fChangeLayout.bind( null, "layout-seven" ),
        "pane-manager:change-layout-eight": fChangeLayout.bind( null, "layout-eight" ),
        "pane-manager:change-layout-nine": fChangeLayout.bind( null, "layout-nine" ),
        "pane-manager:change-layout-ten": fChangeLayout.bind( null, "layout-ten" )
    } ) );

    // Move to pane
    oDisposables.add( atom.commands.add( "atom-workspace", {
        "pane-manager:move-to-pane-one": fMoveToPane.bind( null, 1 ),
        "pane-manager:move-to-pane-two": fMoveToPane.bind( null, 2 ),
        "pane-manager:move-to-pane-three": fMoveToPane.bind( null, 3 ),
        "pane-manager:move-to-pane-four": fMoveToPane.bind( null, 4 ),
        "pane-manager:move-to-pane-five": fMoveToPane.bind( null, 5 ),
        "pane-manager:move-to-pane-six": fMoveToPane.bind( null, 6 ),
        "pane-manager:move-to-pane-seven": fMoveToPane.bind( null, 7 ),
        "pane-manager:move-to-pane-eight": fMoveToPane.bind( null, 8 ),
        "pane-manager:move-to-pane-nine": fMoveToPane.bind( null, 9 ),
        "pane-manager:move-to-pane-ten": fMoveToPane.bind( null, 10 )
    } ) );

    // Focus to pane
    oDisposables.add( atom.commands.add( "atom-workspace", {
        "pane-manager:focus-to-pane-one": fFocusToPane.bind( null, 1 ),
        "pane-manager:focus-to-pane-two": fFocusToPane.bind( null, 2 ),
        "pane-manager:focus-to-pane-three": fFocusToPane.bind( null, 3 ),
        "pane-manager:focus-to-pane-four": fFocusToPane.bind( null, 4 ),
        "pane-manager:focus-to-pane-five": fFocusToPane.bind( null, 5 ),
        "pane-manager:focus-to-pane-six": fFocusToPane.bind( null, 6 ),
        "pane-manager:focus-to-pane-seven": fFocusToPane.bind( null, 7 ),
        "pane-manager:focus-to-pane-eight": fFocusToPane.bind( null, 8 ),
        "pane-manager:focus-to-pane-nine": fFocusToPane.bind( null, 9 ),
        "pane-manager:focus-to-pane-ten": fFocusToPane.bind( null, 10 )
    } ) );
};

fChangeLayout = function( sLayout ) {
    let aLayoutConfig = atom.config.get( `pane-manager.${ sLayout }` );

    if ( !aLayoutConfig ) {
        atom.notifications.addWarning( `Unknown layout ${ sLayout }!`, {
            "detail": "You need to define a layout for that key inside your config!",
            "dismissable": true
        } );
        return;
    }

    PaneUtils
        .saveActiveItem()
        .saveItems()
        .clearPanes()
        .applyLayout( aLayoutConfig )
        .restoreItems()
        .restoreActiveItem();
};

fMoveToPane = function( iTargetPaneIndex = 1 ) {
    PaneUtils
        .saveActiveItem()
        .moveItemTo( iTargetPaneIndex - 1 )
        .restoreActiveItem();
};

fFocusToPane = function( iTargetPaneIndex = 1 ) {
    PaneUtils
        .focusPane( iTargetPaneIndex - 1 );
};

fDeactivate = function() {
    oDisposables.dispose();
};

export {
    oPackageConfig as config,
    fActivate as activate,
    fDeactivate as deactivate
};
