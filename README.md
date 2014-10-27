# Atom: pane-manager

> Set your panes layout, move your files between them, and other useful pane-related stuffs.

* * *

## Features

### Change pane layout

Using the following sequencies, you can change your pane layout :

* `cmd-k cmd-l cmd-1`: `[ 1 ]` (one column, one row)
* `cmd-k cmd-l cmd-2`: `[ 1, 1 ]` (two columns, one row)
* `cmd-k cmd-l cmd-3`: `[ 1, 1, 1 ]` (three columns, one row)
* `cmd-k cmd-l cmd-4`: `[ 1, 1, 1, 1 ]` (four columns, one row)
* `cmd-k cmd-l cmd-5`: `[ 2, 2 ]` (two columns, two rows)
* `cmd-k cmd-l cmd-6`: `[ 2, 2, 2 ]` (three columns, two rows)
* `cmd-k cmd-l cmd-7`: `[ 1, 2 ]` (two columns, last one splitted in two rows)
* `cmd-k cmd-l cmd-8`: `[ 1, 2 ]` (two columns, first one splitted in two rows)
* `cmd-k cmd-l cmd-9`: `[ 1, 1, 2 ]` (three columns, last one splitted in two rows)
* `cmd-k cmd-l cmd-0`: `[ 1, 2, 2 ]` (three columns, last two splitted in two rows)

**Note:** on linux/windows, replace `cmd` by `ctrl`.

### Move a tab to another pane

Use `cmd-k cmd-m cmd-[number]` (or `ctrl-k ctrl-m ctrl-[number]` on linux/windows) to move the active tab to another pane.

**number** is a number between `1` and `0`, **0** representing **ten**.

### Give the focus to another pane

Use `cmd-k cmd-f cmd-[number]` (or `ctrl-k ctrl-f ctrl-[number]` on linux/windows) to give the focus to another pane.

**number** is a number between `1` and `0`, **0** representing **ten**.

## TODO

- [ ] Allowing to configure the layouts in the package settings
