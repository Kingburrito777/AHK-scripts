#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

; C:\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\FortniteClient-Win64-Shipping.exe
; #IfWinActive,  FortniteClient-Win64-Shipping.exe   ;------------------------only works during fornite
; #IfWinActive, FORTNITECLIENT-WIN64-SHIPPING.exe

build_time := 120    ; milliseconds
wait_time := 60    ; milliseconds
use_autobuilder:= #IfWinExist, Fortnite_Sichtsale_v1.1.exe

CenterMouse(w, h) {
    center_x:=w/2
    center_y:=h/2
    MouseMove,center_x,center_y
}

; The exe from https://www.mpgh.net/forum/showthread.php?t=1358341
; Description: this exe requires building/running settings to be default
    ; Build a wall with 1 keypress in less than a milisecond (key = Z)
    ; Build a floor with 1 keypress in less than a milisecond (key = X)
    ; Build some stairs with 1 keypress in less than a milisecond (key = C)
    ; Automatically run with 1 keypress (key = V)
autobuild(){
    Send {z down}
    Send {z up}
    wait(0.85)  ; sec
    Send {c down}
    Send {c up}
}

; builds fortnite stairs (must be in build mode)
FN_Stairs() {
    Send {F3 down}
    Send {F3 up}
    Sleep %wait_time%
    MouseClick,Left
    Sleep %build_time%
}

; builds a fortnite wall (must be in build mode)
FN_Wall(){
    Send {F1 down}
    Send {F1 up}
    Sleep %wait_time%
    MouseClick,Left
    Sleep %build_time%
}

+z::     ; Build mode
    ; MouseClick, X2  ; X2 on my mouse (mouse button 5)
    ; wait(0.2)
    Send {LShift down}
    Send {w down}
    ; todo loop:
    FN_Stairs()
    wait(0.85)
    FN_Wall()
    Send {F3 down}
    Send {F3 up}
    ; wait(0.2)
    ; MouseClick, X2
return

; double pump key g with ctrl or shift
g::
^g::
+g::
    Send {2}
    Sleep 500
    MouseClick ,Left,X,Y,3,0
    Send {3}
    Sleep 500
    MouseClick ,Left,X,Y,3,0
return

; cycle building materials
; while pressing q (better to bind to mouse)
+q::
q::
    key++                         ; this will help cycling through the keys depending on its value
    if (key == 1) {
        FN_Wall()
    } else if (key == 2) {
        FN_Stairs()
        key := 0
    }
return

; wait a sec..
wait(sec){
    Sleep sec*1000
}

; terrible output, tried to build a fort *around* user
l::
    WinGetPos,,, width, height,A
    ; CenterMouse(width, height)
    MouseMove,0,500,10,R
    MouseClick, X2
    Send {F1 down}
    Send {F1 up}
    MouseClickDrag, Left, 2100,0,-2100,0,4,R
    Send {F3 down}
    Send {F3 up}
    MouseMove,0,500,5,R
    Send {Space down}
    Send {Space up}
    Sleep 120
    MouseClick,Left
    MouseClick, X2
return


; Fast mine (as of 4/27/2018)
; PATCHED: (5/1/18)
^c::
    Send {2 down}
    Send {2 up}
    Send {1 down}
    Send {1 up}
    Sleep 295
    Send {Click down}
    Sleep 16
    Send {Click up}
return




