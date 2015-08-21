; http://www.autohotkey.com/board/topic/53057-quick-google-images-dictionary-ahk-and-wikipedia-search/

EnvGet, ProgFiles32, ProgramFiles(x86)

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
  Gui, Font, S14 CDefault, Calibri
  Gui, Add, Edit, x12 y10 w550 h30 vTheSearch, %SearchTerm%
  Gui, Font
  Gui, Add, Button, Hidden Default, OK 
  Gui, Show, xCenter yCenter h70 w569, Text Search
  
  Sleep 50 
  ControlFocus, Edit1, ahk_class AutoHotkeyGUI
  SearchTerm =
  Return

GuiClose: 
ButtonOK:
  Gui, Submit
  Gui destroy
  Run, "%ProgFiles32%\Google\Chrome\Application\chrome.exe" "http://www.google.com/search?q=%TheSearch%"
  Return