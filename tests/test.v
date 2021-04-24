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

module main
import v_osdialog

fn main(){
	prompt_test()
	message_test()
}



fn prompt_test(){
	response := v_osdialog.prompt(v_osdialog.Levels.info, "message", "")
	print(response)

}
fn message_test(){
	response := v_osdialog.message(v_osdialog.Levels.info, v_osdialog.Buttons.yes_no, "message")
	print(response)

}
fn file_test(){

}