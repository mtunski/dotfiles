; Send tilde with 1 keystroke
+`::
  Send {U+007E}
Return

; Send space on altgr+space (fix typing space after a word ending with Polish diactric sign)
;<^>!Space::
;  Send {Space}
;Return

; Move current active window between desktops
!^#Left::
  WinGetTitle, Title, A
  WinSet, ExStyle, ^0x80, %Title%
  Send {LWin down}{Ctrl down}{Left}{Ctrl up}{LWin up}
  sleep, 50
  WinSet, ExStyle, ^0x80, %Title%
  WinActivate, %Title%
Return

!^#Right::
  WinGetTitle, Title, A
  WinSet, ExStyle, ^0x80, %Title%
  Send {LWin down}{Ctrl down}{Right}{Ctrl up}{LWin up}
  sleep, 50
  WinSet, ExStyle, ^0x80, %Title%
  WinActivate, %Title%
Return

; Remap CapsLock to Escape
Capslock::Esc

; Remap Ctrl + Shift + w to Alt + F4
^+w:: Send !{f4}

; Disable ctrl + esc
;^escape::
;Return

;~!Tab::
;KeyWait, Alt
;KeyWait, Tab
;WinGetPos,x,y,width,height,A
;While (x < 0 Or y < 0)
;{
;    Sleep,100
;    WinGetPos,x,y,width,height,A
;    IfGreater,A_Index,2,Break
;}
;MouseMove,width/2,height/2
;return

;~!`::
;KeyWait, Alt
;KeyWait, `
;WinGetPos,x,y,width,height,A
;While (x < 0 Or y < 0)
;{
;    Sleep,100
;    WinGetPos,x,y,width,height,A
;    IfGreater,A_Index,2,Break
;}
;MouseMove,width/2,height/2
;return
