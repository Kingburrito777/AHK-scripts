#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

#IfWinNotActive ahk_class ConsoleWindowClass

~lButton::
  cos_mousedrag_treshold := 20 ; pixels
  MouseGetPos, cos_mousedrag_x, cos_mousedrag_y
  keywait lbutton
  mousegetpos, cos_mousedrag_x2, cos_mousedrag_y2
  if (abs(cos_mousedrag_x2 - cos_mousedrag_x) > cos_mousedrag_treshold
    or abs(cos_mousedrag_y2 - cos_mousedrag_y) > cos_mousedrag_treshold)
  {
    wingetclass cos_class, A
    if (cos_class == "Emacs")
      sendinput !w
    else
      sendinput ^c
  }
  return
  
; firefox does pasting on middleclick by itself
#IfWinNotActive ahk_class MozillaUIWindowClass

~mbutton::
  WinGetClass cos_class, A
  ;; emacs does pasting on middleclick by itself
  if (cos_class <> "Emacs")
    SendInput ^v
  return
  
#IfWinNotActive


;; clipx
^mbutton::
  sendinput ^+{insert}
  return