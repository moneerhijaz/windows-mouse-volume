#Requires AutoHotkey v2.0
#SingleInstance Force
#UseHook

; Press either side button and a message box will tell you which one it is.
; Press Esc to close the script.

~XButton1::ShowWhichButton("XButton1")
~XButton2::ShowWhichButton("XButton2")

ShowWhichButton(btnName) {
    MsgBox "You pressed: " btnName
}

Esc::ExitApp
