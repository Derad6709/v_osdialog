# module v_osdialog
A cross platform wrapper for OS dialogs like file save, open, message boxes, inputs, color picking, etc. for [V](https://vlang.io).

Currently tested MacOS, Windows.

# license

Original С-osdialog is released into the public domain [(CC0)](https://github.com/AndrewBelt/osdialog/blob/master/LICENSE.txt). 

[V](https://vlang.io)-wrapper is released under [Apache License 2.0](LICENSE).


## Contents
- [file](#file)
- [message](#message)
- [prompt](#prompt)
- [Actions](#Actions)
- [Buttons](#Buttons)
- [Levels](#Levels)

## file
```v
fn file(action Actions, path string, filename string, filters string) string
```

[[Return to contents]](#Contents)

## message
```v
fn message(level Levels, buttons Buttons, message string) bool
```


[[Return to contents]](#Contents)

## prompt
```v
fn prompt(level Levels, message string, text string) string
```


[[Return to contents]](#Contents)

## Actions
```v
enum Actions {
	open_file = C.OSDIALOG_OPEN
	open_dir = C.OSDIALOG_OPEN_DIR
	save = C.OSDIALOG_SAVE
}
```


[[Return to contents]](#Contents)

## Buttons
```v
enum Buttons {
	ok = C.OSDIALOG_OK
	ok_cancel = C.OSDIALOG_OK_CANCEL
	yes_no = C.OSDIALOG_YES_NO
}
```


[[Return to contents]](#Contents)

## Levels
```v
enum Levels {
	info = C.OSDIALOG_INFO
	warning = C.OSDIALOG_WARNING
	error = C.OSDIALOG_ERROR
}
```


[[Return to contents]](#Contents)

#### Powered by vdoc. Generated on: 24 Apr 2021 19:12:45
