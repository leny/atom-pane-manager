# Atom: pane-manager

> Set your panes layout, move your files between them, and other useful pane-related stuffs.

* * *

## WARNING: breaking changes in `1.0`!

If you used this package before its `1.0` version, you need to read the following documentation: commands name have changed and keybindings have been disabled to make overriding easier.

* * *

## Keybindings

With the success of Atom, it's really difficult to choose keybindings that will not enter in conflict whit anyone else's packages, so I have removed the default keystrokes and left the keymap empty to let you set your own keybindings.

See [keymaps/pane-manager.cson](https://github.com/leny/atom-pane-manager/blob/master/keymaps/pane-manager.cson) for suggestions.

## Features

### Change pane layouts

Use commands `pane-manager:change-layout-[number]` to switch between layouts (`[number]` can be one of the following : `one`, `two`, `three`, `four`, `five`, `six`, `seven`, `eight`, `nine`, `ten`).

#### Customize layouts

Using the following config parameters, you can customize your pane layouts (following are defaults).

* `layout-one`: `[ 1 ]` (one column, one row)
* `layout-two`: `[ 1, 1 ]` (two columns, one row)
* `layout-three`: `[ 1, 1, 1 ]` (three columns, one row)
* `layout-four`: `[ 1, 1, 1, 1 ]` (four columns, one row)
* `layout-five`: `[ 2, 2 ]` (two columns, two rows)
* `layout-six`: `[ 2, 2, 2 ]` (three columns, two rows)
* `layout-seven`: `[ 1, 2 ]` (two columns, last one splitted in two rows)
* `layout-eight`: `[ 1, 2 ]` (two columns, first one splitted in two rows)
* `layout-nine`: `[ 1, 1, 2 ]` (three columns, last one splitted in two rows)
* `layout-ten`: `[ 1, 2, 2 ]` (three columns, last two splitted in two rows)

### Give the focus to another pane

Use commands `pane-manager:focus-to-pane-[number]` to change the focus to target pane (`[number]` can be one of the following : `one`, `two`, `three`, `four`, `five`, `six`, `seven`, `eight`, `nine`, `ten`).

### Move a tab to another pane

Use commands `pane-manager:move-to-pane-[number]` to move current tab to target pane (`[number]` can be one of the following : `one`, `two`, `three`, `four`, `five`, `six`, `seven`, `eight`, `nine`, `ten`).
