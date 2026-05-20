#NoEnv
#SingleInstance Force
SendMode Input
SetWorkingDir %A_ScriptDir%

global cvActive := false
global cvHandsFree := false
global cvPendingTap := false
global cvDownTick := 0
global cvOriginalHwnd := 0
global cvInputPath := ""
global cvOutputPath := ""

; Right Alt behavior:
; - Hold RAlt: dictate while held, release to let Codex polish and paste.
; - Double-tap RAlt: start hands-free dictation.
; - Press RAlt again in hands-free mode: finish, let Codex polish, and paste.
RAlt::
    if (cvActive && cvHandsFree) {
        Gosub, CV_FinishAndPaste
        return
    }

    if (cvActive && cvPendingTap) {
        SetTimer, CV_CancelShortTap, Off
        cvPendingTap := false
        cvHandsFree := true
        TrayTip, Codex Voice Input, Hands-free dictation. Press Right Alt again to paste., 3, 1
        KeyWait, RAlt
        return
    }

    if (!cvActive) {
        cvHandsFree := false
        cvPendingTap := false
        cvDownTick := A_TickCount
        Gosub, CV_StartDictation
        KeyWait, RAlt

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
^!Space::
    if (!cvActive) {
        cvHandsFree := true
        Gosub, CV_StartDictation
        TrayTip, Codex Voice Input, Dictation pad opened. Press Right Alt to paste., 3, 1
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
