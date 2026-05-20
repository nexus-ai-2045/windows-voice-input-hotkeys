#NoEnv
#SingleInstance Force
SendMode Input
SetWorkingDir %A_ScriptDir%

global cvConfigPath := A_ScriptDir "\codex_voice_input.ini"
global cvHoldHotkey := CV_ReadConfig("HoldHotkey", "RAlt")
global cvPadHotkey := CV_ReadConfig("PadHotkey", "^!Space")
global cvEnableMouseWheelDoubleClick := CV_ReadConfig("EnableMouseWheelDoubleClick", "1")
global cvMouseWheelDoubleClickMs := CV_ReadConfig("MouseWheelDoubleClickMs", "350")
global cvActive := false
global cvHandsFree := false
global cvPendingTap := false
global cvDownTick := 0
global cvOriginalHwnd := 0
global cvInputPath := ""
global cvOutputPath := ""
global cvLastMButtonTick := 0

; Hold hotkey behavior:
; - Hold the configured key: dictate while held, release to let Codex polish and paste.
; - Double-tap it: start hands-free dictation.
; - Press it again in hands-free mode: finish, let Codex polish, and paste.
Hotkey, %cvHoldHotkey%, CV_HoldHotkey
Hotkey, %cvPadHotkey%, CV_OpenDictationPad

if (cvEnableMouseWheelDoubleClick = "1") {
    Hotkey, ~MButton, CV_MouseWheelClick
}

return

CV_HoldHotkey:
    if (cvActive && cvHandsFree) {
        Gosub, CV_FinishAndPaste
        return
    }

    if (cvActive && cvPendingTap) {
        SetTimer, CV_CancelShortTap, Off
        cvPendingTap := false
        cvHandsFree := true
        TrayTip, Codex Voice Input, Hands-free dictation. Press %cvHoldHotkey% again to paste., 3, 1
        KeyWait, %cvHoldHotkey%
        return
    }

    if (!cvActive) {
        cvHandsFree := false
        cvPendingTap := false
        cvDownTick := A_TickCount
        Gosub, CV_StartDictation
        KeyWait, %cvHoldHotkey%

        if (!cvActive || cvHandsFree) {
            return
        }

        heldMs := A_TickCount - cvDownTick
        if (heldMs < 260) {
            cvPendingTap := true
            SetTimer, CV_CancelShortTap, -360
            return
        }

        Gosub, CV_FinishAndPaste
    }
return

; Fallback: open the temporary dictation pad without using Right Alt timing.
CV_OpenDictationPad:
    if (!cvActive) {
        cvHandsFree := true
        Gosub, CV_StartDictation
        TrayTip, Codex Voice Input, Dictation pad opened. Press %cvHoldHotkey% to paste., 3, 1
    }
return

CV_MouseWheelClick:
    if (A_TickCount - cvLastMButtonTick <= cvMouseWheelDoubleClickMs) {
        cvLastMButtonTick := 0
        if (!cvActive) {
            cvHandsFree := true
            Gosub, CV_StartDictation
            TrayTip, Codex Voice Input, Dictation pad opened. Press %cvHoldHotkey% to paste., 3, 1
        }
    } else {
        cvLastMButtonTick := A_TickCount
    }
return

CV_StartDictation:
    cvActive := true
    cvOriginalHwnd := WinExist("A")
    FormatTime, stamp,, yyyyMMdd-HHmmss
    FileCreateDir, %A_Temp%\codex-voice-input
    cvInputPath := A_Temp "\codex-voice-input\codex-input-" stamp "-" A_TickCount ".txt"
    cvOutputPath := A_Temp "\codex-voice-input\codex-output-" stamp "-" A_TickCount ".txt"

    Gui, CV:Destroy
    Gui, CV:+AlwaysOnTop +ToolWindow -MinimizeBox
    Gui, CV:Margin, 12, 12
    Gui, CV:Font, s11, Yu Gothic UI
    Gui, CV:Add, Text,, Windows voice typing is listening here. Codex will polish and paste it back.
    Gui, CV:Add, Edit, vCVText w560 h150
    Gui, CV:Show,, Codex Voice Input
    GuiControl, CV:Focus, CVText
    Sleep, 180
    Send, {LWin Down}h{LWin Up}
    TrayTip, Codex Voice Input, Dictate now..., 2, 1
return

CV_FinishAndPaste:
    if (!cvActive) {
        return
    }

    cvActive := false
    cvHandsFree := false
    cvPendingTap := false
    SetTimer, CV_CancelShortTap, Off

    Send, {LWin Down}h{LWin Up}
    Sleep, 250
    Gui, CV:Submit, NoHide
    rawText := CVText
    Gui, CV:Destroy

    if (cvOriginalHwnd) {
        WinActivate, ahk_id %cvOriginalHwnd%
        Sleep, 120
    }

    rawText := Trim(rawText)
    if (rawText = "") {
        TrayTip, Codex Voice Input, No dictated text., 3, 2
        return
    }

    FileDelete, %cvInputPath%
    FileDelete, %cvOutputPath%
    FileAppend, %rawText%, %cvInputPath%, UTF-8

    TrayTip, Codex Voice Input, Codex is polishing..., 3, 1
    RunWait, powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%A_ScriptDir%\codex_text_polish.ps1" -InputPath "%cvInputPath%" -OutputPath "%cvOutputPath%", %A_ScriptDir%, Hide
    if (ErrorLevel = 0) {
        Send, ^v
        TrayTip, Codex Voice Input, Pasted., 2, 1
    } else {
        SetClipboard(rawText)
        Send, ^v
        TrayTip, Codex Voice Input, Codex failed. Pasted raw dictation., 5, 2
    }
return

CV_CancelShortTap:
    if (cvActive && cvPendingTap && !cvHandsFree) {
        cvActive := false
        cvPendingTap := false
        Send, {LWin Down}h{LWin Up}
        Gui, CV:Destroy
        TrayTip, Codex Voice Input, Canceled., 1, 1
    }
return

SetClipboard(text) {
    Clipboard :=
    Clipboard := text
    ClipWait, 1
}

CV_ReadConfig(key, defaultValue) {
    global cvConfigPath
    IniRead, value, %cvConfigPath%, Hotkeys, %key%, %defaultValue%
    return value
}
