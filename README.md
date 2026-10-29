# Mouse volume control for Windows

An AutoHotkey **v2** utility: hold a side button and move the mouse vertically or turn its wheel to send Windows volume-up/down keys.

1. Install AutoHotkey v2 on Windows (v1 syntax is incompatible).
2. Double-click `test_button.ahk` and press a side button to identify `XButton1` or `XButton2`; Esc closes the tester.
3. Set `SideBtn` in `mouse_volume.ahk`. Defaults are 10 pixels per volume step, 10 ms polling, and one step per wheel notch.
4. Double-click `mouse_volume.ahk`. Start with low audio volume and verify hold/move and hold/wheel behavior.

Ctrl+Alt+R reloads the controller; Ctrl+Alt+Q exits it. The tray menu also allows exit. Windows controls the resulting volume step size; this script sends media keys rather than setting an exact percentage.

Status: small desktop utility. Interactive validation requires Windows, AutoHotkey v2, and a mouse; it was not run on this Linux review host. [License](LICENSE). [Linux/X11 counterpart](https://github.com/moneerhijaz/linux-mouse-volume).
