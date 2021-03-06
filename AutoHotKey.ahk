; Warren Gavin
;
; warren@dubelyoo.com
;
; AutoHotKey init file.  All other scripts are located on my DropBox account.
;

#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.

#SingleInstance force
#MaxHotkeysPerInterval 200

SendMode Input  ; Reccommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

EnvGet, userProfile, USERPROFILE
EnvGet, ProgFiles32, ProgramFiles(x86)

Chrome := ProgFiles32 . "\Google\Chrome\Application\chrome.exe"
Sublime := A_ProgramFiles . "\Sublime Text 2\sublime_text.exe"

#Include KeyMappings.ahk
;#Include Mouse.ahk ; Current mouse seems to scroll the way I want.
#Include HotKeys.ahk
#Include HotStrings.ahk