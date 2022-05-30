// Copyright 2021 Valerii
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
//     http://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

module v_osdialog
#flag @VROOT/osdialog/osdialog.o
#include "@VROOT/osdialog/osdialog.h"

//macos
#flag darwin @VROOT/osdialog/osdialog_mac.m 
#flag darwin -framework AppKit

//windows
#flag windows @VROOT/osdialog/osdialog_win.c
#flag windows -lcomdlg32


struct C.osdialog_filter_patterns{}
struct C.osdialog_filters {}
struct C.osdialog_color {}
struct Color {
	r int
	g int
	b int
	a int
}

pub enum Actions {
	open_file = C.OSDIALOG_OPEN 
	open_dir = C.OSDIALOG_OPEN_DIR 
	save = C.OSDIALOG_SAVE 

}

pub enum Buttons {
	ok = C.OSDIALOG_OK
	ok_cancel = C.OSDIALOG_OK_CANCEL
	yes_no = C.OSDIALOG_YES_NO

}
pub enum Levels {
	info = C.OSDIALOG_INFO
	warning = C.OSDIALOG_WARNING
	error = C.OSDIALOG_ERROR

}
fn C.osdialog_filters_parse(
	str &char
) &C.osdialog_filters 
fn C.osdialog_file(
	action Actions,
	path &char, 
	filename &char, 
	filters C.osdialog_filters,
	) &char
fn C.osdialog_message(
	level Levels,
	buttons Buttons, 
	message &char, 
	) int
fn C.osdialog_prompt(
	level Levels,
	message &char, 
	text &char
	) &char

fn C.osdialog_color_picker(
	color osdialog_color
	opacity int
	) int


// opens file dialog 
pub fn file(action Actions, path string, filename string, filters string) string {
	
	if filters == "none"{
		response := C.osdialog_file(action, &char(path.str), &char(filename.str), C.NULL)
		if response == C.NULL {
			return(error("unselected")) 
		}else{
			return unsafe {response.vstring()} }


	}else{
		s := C.osdialog_filters_parse(&char(filters.str))
		response := C.osdialog_file(action, &char(path.str), &char(filename.str), voidptr(s))
		if response == C.NULL {
			return(error("unselected")) 
		}else{
			return unsafe {response.vstring()} }

	
	}
}	

pub fn message(level Levels, buttons Buttons, message string) bool{
	reponse := C.osdialog_message(level, buttons, &char(message.str))
	if reponse == 1{
		return true
	}else{
		return false
	}
}

pub fn prompt(level Levels, message string, text string) string {
	response := C.osdialog_prompt(level, &char(message.str), &char(text.str))
	return unsafe {response.vstring()} 
}

pub fn color_picker(color Color, opacity int) int{
	return C.osdialog_color_picker(color, opacity)
	
}