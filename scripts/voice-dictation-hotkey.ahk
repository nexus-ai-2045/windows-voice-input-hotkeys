#Requires AutoHotkey v2.0
#SingleInstance Force

; Ctrl + Alt + Space toggles Windows voice typing in the active app.
^!Space::Send "#h"

; Optional: uncomment the next line if you want CapsLock to start voice typing.
; CapsLock::Send "#h"
