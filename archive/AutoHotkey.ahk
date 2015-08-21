; Warren Gavin
; warren@dubelyoo.com
;
; TODO:
;     - Instructions on Boot Camp keyboard drivers
;     - Rethink on modules as this is more than just Mac keyboard specific
;
;
; Below is a AutoHotKey script I created to specifically support a wireless Mac keyboard. There are other
; automations defined but I am included them to keep it all in one script.
;
; Features That Worked After Boot Camp Keyboard Drivers Installed
;     - Media Controls
;     - Volume Contols
;     - Fn key

#NoEnv
#MaxHotkeysPerInterval 1000
#SingleInstance force
#InstallKeybdHook

SendMode Input

;EnvGet, programFiles, ProgramFiles

; Reverse Scroll
WheelUp::Send {WheelDown}
WheelDown::Send {WheelUp}

; Save
#s::Send ^s

; Select all
#a::Send ^a

; Copy
#c::Send ^c

; Paste
#v::Send ^v

; Cut
#x::Send ^x

; Open
#o::Send ^o

; Find
#f::Send ^f

; Find Next
#g::Send ^g

; Undo
#z::Send ^z

; Repeat
#y::Send ^y

; New tab
#t::Send ^t

; Close window
#w::Send ^w

; New window
#n::Send ^n

; Alt Tab flip flop
Lwin & Tab::AltTab

; Bold
#b::Send ^b

; Italics
#i::Send ^i





; Google Chrome
#IfWinActive, ahk_class Chrome_WidgetWin_1

  ; Find Previous
  +#g::Send +^g

  ; Paste as plain text
  #+v::Send ^+v

#IfWinActive



; Microsoft Excel
#IfWinActive, ahk_class XLMAIN

  ; Save as
  #+s::F12

  #Up::Send ^{Up}
  #Down::Send ^{Down}

#IfWinActive

; Microsoft Word
#IfWinActive, ahk_class OpusApp

  ; Save as
  #+s::F12

#IfWinActive



; Opens Chrome with a Google search on the selected text.
!#g::
  ClipTemp := Clipboard
  Send ^c
  ClipWait
  Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "http://www.google.com/search?q=%Clipboard%"
  Clipboard := ClipTemp
  Return

; Opens Sublime to edit AutoHotKey script.
!#e::
  Run, "%A_ProgramFiles%\Sublime Text 2\sublime_text.exe" %A_ScriptFullPath%
  Return

; Reloads AutoHotKey script.
!#r::Reload

; Resize current window to standard sizes
; https://gist.github.com/ronjouch/2428558
MoveWindow(width, height)
{
  WinMove, A, , , , width, height
  ToolTip, %width%x%height%
  Sleep, 500
  ToolTip,
  Return
}

!#1::MoveWindow(1280, 800)
!#2::MoveWindow(1024, 768)
!#3::MoveWindow(800, 600)


; Paste as pure text, http://www.autohotkey.com/community/viewtopic.php?t=11427
; https://gist.github.com/ronjouch/2428558
!#v::
  Clip0 = %ClipBoardAll%
  ClipBoard = %ClipBoard%
  Send ^v
  Sleep 50
  ClipBoard = %Clip0%
  VarSetCapacity(Clip0, 0)
  Return


; Hotsrings

::dff::
FormatTime, CurrentDateTime,, yyyy-MM-dd
SendInput %CurrentDateTime%
Return

::w@::warren@dubelyoo.com

::wgc::[Warren Gavin]