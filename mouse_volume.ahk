#Requires AutoHotkey v2.0
#UseHook
CoordMode "Mouse", "Screen"

; ========= CONFIG =========
SideBtn := "XButton2"  ; confirmed side button
StepPx  := 10          ; vertical pixels per volume step (lower = more sensitive)
PollMs  := 10          ; sampling period while holding the button (ms)
WheelMultiplier := 1   ; volume steps per wheel notch while holding SideBtn
; =========================

; --- Hold side button + scroll to change volume (fast) ---
#HotIf GetKeyState(SideBtn, "P")
WheelUp::  RepeatVol( 1)
WheelDown::RepeatVol(-1)
#HotIf

RepeatVol(dir) {
    global WheelMultiplier
    if (dir > 0) {
        Loop WheelMultiplier
            Send "{Volume_Up}"
    } else {
        Loop WheelMultiplier
            Send "{Volume_Down}"
    }
}

; --- Hold side button and move mouse up/down to change volume (no accel, no lock) ---
Hotkey(SideBtn, (*) => AdjustByMouse(SideBtn))

AdjustByMouse(btn) {
    global StepPx, PollMs
    MouseGetPos &sx, &sy
    lastY := sy
    accum := 0.0

    while GetKeyState(btn, "P") {
        MouseGetPos &cx, &cy
        accum += (cy - lastY)
        lastY := cy

        steps := Floor(Abs(accum) / StepPx)
        if (steps > 0) {
            if (accum < 0) {
                Loop steps
                    Send "{Volume_Up}"
            } else {
                Loop steps
                    Send "{Volume_Down}"
            }
            accum -= (accum > 0 ? 1 : -1) * steps * StepPx
        }
        Sleep PollMs
    }
}

; Optional: quick reload/quit
^!r::Reload()    ; Ctrl+Alt+R
^!q::ExitApp()   ; Ctrl+Alt+Q
