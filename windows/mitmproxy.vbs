Dim WinScriptHost
Set WinScriptHost = CreateObject("WScript.Shell")
WinScriptHost.Run """C:\Program Files (x86)\mitmproxy\bin\mitmdump.exe"" --mode reverse:http://local.surferseo.com:4000 --listen-port 4443", 0
Set WinScriptHost = Nothing
