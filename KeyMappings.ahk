; Warren Gavin
; warren@dubelyoo.com
;
; Helpful Reminders
;
; # = Windows
; ! = Alt
; ^ = Control
; + = Shift
; < = Left
; > = Right
;
; TODO:
;     - Instructions on Boot Camp keyboard drivers
;     - Rethink on modules as this is more than just Mac keyboard specific
;
;
; Below is a AutoHotKey script I created to specifically support a wireless
; Mac keyboard. There are other automations defined but I am included them
; to keep it all in one script.
;
; Features That Worked After Boot Camp Keyboard Drivers Installed
;     - Media Controls
;     - Volume Contols
;     - Fn key
;

; Common Mac OS X keyboard shortcut mappings
#s::Send ^s ; Save
#a::Send ^a ; Select all
#c::Send ^c ; Copy
#v::Send ^v ; Paste
#x::Send ^x ; Cut
#o::Send ^o ; Open
#f::Send ^f ; Find
#g::Send ^g ; Find Next
#z::Send ^z ; Undo
#y::Send ^y ; Repeat
#t::Send ^t ; New tab
#w::Send ^w ; Close window
#n::Send ^n ; New window
#b::Send ^b ; Bold
#i::Send ^i ; Italics
Lwin & Tab::AltTab ; Alt Tab flip flop

; TODO Review http://support.apple.com/kb/HT1343 and determine the Windows
; equivilant.

; Boot Camp enabled keys.
;
; PgUp with fnUp
; PgDn with fnDn
; Home with fn<
; End  with fn>


; The following section generally maps to key commands from Mac OS X like
; programs.


; Google Chrome
#IfWinActive, ahk_class Chrome_WidgetWin_1

  +#g::Send +^g ; Find Previous
  #+v::Send ^+v ; Paste as plain text
  #q::Send ^+q ; Exit

#IfWinActive

; Microsoft Outlook 2013
#IfWinActive, ahk_class rctrl_renwnd32

  #q::!F4

#IfWinActive

; Microsoft Excel specifics
#IfWinActive, ahk_class XLMAIN

  #+s::F12 ; Save as
  #Up::Send ^{Up}
  #Down::Send ^{Down}

#IfWinActive

; Microsoft Word specifics
#IfWinActive, ahk_class OpusApp

  #+s::F12 ; Save as

#IfWinActive

; Sublime Text
#IfWinActive, ahk_class PX_WINDOW_CLASS

  #q::!F4 ; Exit

#IfWinActive

; Command shell
#IfWinActive ahk_class ConsoleWindowClass

  #v::
    SendInput {Raw}%clipboard%
    return

#IfWinActive
