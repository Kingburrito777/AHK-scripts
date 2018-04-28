#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

; C:\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\FortniteClient-Win64-Shipping.exe
; #IfWinActive,  FortniteClient-Win64-Shipping.exe   ;------------------------only works during fornite
#IfWinActive, Fortnite

build_time := 90    ; milliseconds

CenterMouse(w, h) {
    center_x:=w/2
    center_y:=h/2
    MouseMove,center_x,center_y
}

; builds fortnite stairs
FN_Stairs() {
    Send {F3 down}
    Send {F3 up}
    MouseClick,Left
    Sleep %build_time%
}

; builds a fortnite wall
FN_Wall(){
    Send {F1 down}
    Send {F1 up}
    MouseClick,Left
    Sleep %build_time%
}

; cycle building materials
; run while pressing q ! (better to bind to mouse)
+q::
    key++                         ; this will help cycling through the keys depending on its value
    if (key == 1) {
        FN_Wall()
    } else if (key == 2) {
        FN_Stairs()
        key := 0
    }
    return

; half sec between stairs and wall
wait(sec){
    Sleep sec*1000
}

; terrible output
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
c::
    Send {2 down}
    Send {2 up}
    Send {1 down}
    Send {1 up}
    Sleep 295
    Send {Click down}
    Sleep 150
    Send {Click up}
return

; Shift + Z (running + building macro)
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



