;DetectHiddenWindows, On
SendMessage, 0x000006fb, 0x00000002, 0x00000000, , Lync
SendMessage, 0x000006fb, 0x00000000, 0x00150208, , Lync
SendMessage, 0x000006fb, 0x00000001, 0x00150208, , Lync
SendMessage, 0x000006fb, 0x00000000, 0x00000000, , Lync

SendMessage, 0x000006fb, 0x00000002, 0x00000000, , Lync
SendMessage, 0x000006fb, 0x00000000, 0x002706be, , Lync
SendMessage, 0x000006fb, 0x00000001, 0x002706be, , Lync
SendMessage, 0x000006fb, 0x00000000, 0x00000000, , Lync

; Lync 2010
;DetectHiddenWindows, On
;PostMessage, WM_COMMAND := 0x111, 40172, 0, , ahk_class CommunicatorMainWindowClass

    ; Available      = 40165
    ; Busy           = 40168
    ; Do Not Disturb = 40169
    ; Be Right Back  = 40170
    ; Appear Away    = 40172
    ; Off Work       = 40175