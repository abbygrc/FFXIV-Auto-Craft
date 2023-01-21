SetWorkingDir %A_ScriptDir%
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
CoordMode, ToolTip, Screen
SendMode Input
#SingleInstance Force
SetTitleMatchMode 2
#WinActivateForce
SetControlDelay 1
SetWinDelay 0
SetKeyDelay 0, 50
SetMouseDelay -1
SetBatchLines -1

; add assets
startBtn = startbtn.png
stopBtn = stopbtn.png
FileInstall, startbtn.png, %startBtn%, 1
FileInstall, stopbtn.png, %stopBtn%, 1

; draw ui
Gui, +AlwaysOnTop
Gui, Font, s10
Gui, Add, Text, x20 y10, Iterations:
Gui, Add, Edit, x90 y9 h18 w40
Gui, Add, UpDown, vIterations Range0-999, 0
Gui, Add, Text, x20 y31, Delay:
Gui, Add, Edit, x90 y30 h18 w40
Gui, Add, UpDown, vDelay Range0-999, 0
Gui, Add, Text, x20 y63, Status:
Gui, Font, Bold s11
Gui, Add, Text, x88 y63 cRed vStatus, Inactive
Gui, Add, Picture, x160 y11 h30 w75 gStartButton ,%startBtn%
Gui, Add, Picture, h30 w75 gStopButton ,%stopBtn%

gui, show, w255, FFXIV Autocraft
return

; button functionalities
StartButton:
    Gui, submit, NoHide
    Start()
return

StopButton:
    Gui, submit, NoHide
    Stop()
return

; methods
Start()
{
    global

    Counter := 0
    Gui, Font, Bold s10 cGreen
    GuiControl, Font, Status
    GuiControl,, Status, Active
    While (Counter != Iterations)
    {
        Counter += 1
        ControlSend, , {\}, FINAL FANTASY XIV
        Sleep 1000
        ControlSend, , {\}, FINAL FANTASY XIV
        Sleep 1000
        ControlSend, , {\}, FINAL FANTASY XIV
        Sleep 2000
        ControlSend, , {Ins}, FINAL FANTASY XIV
        Sleep Delay*1000
    }
    Gui, Font, Bold s10 cBlue
    GuiControl, Font, Status
    GuiControl,, Status, Done!
}

Stop()
{
    global

    Gui, Font, Bold s10 cRed
    GuiControl, Font, Status
    GuiControl,, Status, Inactive
    Counter := Iterations
}