#Requires AutoHotkey v2.0
#SingleInstance Force

configPath := A_ScriptDir "\voice-dictation-hotkey.ini"

voiceTypingHotkey := IniRead(configPath, "Hotkeys", "VoiceTypingHotkey", "^!Space")
enableMouseWheelDoubleClick := IniRead(configPath, "Hotkeys", "EnableMouseWheelDoubleClick", "1")
mouseWheelDoubleClickMs := Integer(IniRead(configPath, "Hotkeys", "MouseWheelDoubleClickMs", "350"))

Hotkey(voiceTypingHotkey, ToggleVoiceTyping)

if (enableMouseWheelDoubleClick = "1") {
    Hotkey("~MButton", HandleMouseWheelClick)
}

ToggleVoiceTyping(*) {
    Send "#h"
}

HandleMouseWheelClick(*) {
    global mouseWheelDoubleClickMs

    if (A_PriorHotkey = "~MButton" && A_TimeSincePriorHotkey <= mouseWheelDoubleClickMs) {
        Send "#h"
    }
}

; 任意: CapsLock で音声入力を始めたい場合は、次の行のコメントを外してください。
; CapsLock::Send "#h"
