; Warren Gavin
; warren@dubelyoo.com
;
; A collection of HotKey snipits
;


GetSelectedText()
{
  ClipTemp := Clipboard ; backup clipboard
  Send ^c ; copy selected text
  ClipWait ; wait for clipboard to populate
  selected := Clipboard ; store Clipboard contents
  Clipboard := ClipTemp ; restore previous Clipboard

  return (selected = "" ? Clipboard : selected) ; return selected text unless it's blank, then return clipboard
}

ReplaceWithSpace(s)
{
  StringReplace, s, s, %A_Tab%, %A_SPACE%, ALL ; replace tabs w/spaces
  StringReplace, s, s, 'r'n'r'n, %A_SPACE%, ALL ; remove duplicate CR+LF's
  StringReplace, s, s, 'r'n, %A_SPACE%, ALL ; replace CR+LF w/spaces

  return s
}

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





; Opens Chrome with a Google search on the selected text.
!#g::
  ClipTemp := Clipboard
  selected := ReplaceWithSpace(GetSelectedText())
  Run, "%Chrome%" "http://www.google.com/search?q=%selected%"
  Return

; Opens Sublime to edit AutoHotKey script.
!#e::
  Run, "%Sublime%" %A_ScriptFullPath%
  Return

; Reloads AutoHotKey script.
!#r::Reload


; Paste as pure text, http://www.autohotkey.com/community/viewtopic.php?t=11427
; https://gist.github.com/ronjouch/2428558
!#v::
  Clip0 = %ClipBoardAll%
  ClipBoard = %ClipBoard% ; Convert to text
  Send ^v
  Sleep 50 ; Don't change clipboard while it is pasted! (Sleep > 0)
  ClipBoard = %Clip0% ; Restore original ClipBoard
  VarSetCapacity(Clip0, 0) ; Free memory
  Return

!#1::MoveWindow(1280, 800)
!#2::MoveWindow(1024, 768)
!#3::MoveWindow(800, 600)


; GUI to search Google and open Chrome.
^+g::
  IfWinExist Text Search
  {
    WinActivate
    Return
  }
  Else
  {
    GoTo, GUI
  }

GUI:
  Gui, Font, S32, Arial
  Gui, -Caption ; removes title bar
  Gui, Add, Edit, x5 y5 h64 w600  vTheSearch, %SearchTerm%
  Gui, Add, Button, Hidden Default, OK
  Gui, Show, xCenter yCenter h74 w610, Text Search

  Sleep 50
  ControlFocus, Edit1, ahk_class AutoHotkeyGUI
  SearchTerm =
  Return

GuiClose:
ButtonOK:
  Gui, Submit
  Gui destroy
  Run, "%Chrome%" "http://www.google.com/search?q=%TheSearch%"
  Return
