@echo off
SETLOCAL

:: Use double slash \\ for .reg compatibility

set "ghpath=%localappdata%\GitHubDesktop"
set "ghpath=%ghpath:\=\\%"

set ghbin=%ghpath%\\bin
set ghexe=%ghpath%\\GitHubDesktop.exe
set ghbat=%ghbin%\\github.bat

set noshell=%ghbin%\\noshell.vbs
mkdir "%ghbin%" >nul 2>&1

:: Remove previous context menu entries
reg delete "HKEY_CURRENT_USER\Software\Classes\Directory\shell\GitHubDesktopOpenWith" /f > nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Classes\Directory\Background\shell\GitHubDesktopOpenWith" /f > nul 2>&1


:: Create noshell.vbs in order to run github.bat silently (to avoid cmd window popup)
echo 'from http://superuser.com/questions/140047                                                   >"%noshell%"
echo If WScript.Arguments.Count ^>= 1 Then                                                        >>"%noshell%"
echo     ReDim arr(WScript.Arguments.Count-1)                                                     >>"%noshell%"
echo     For i = 0 To WScript.Arguments.Count-1                                                   >>"%noshell%"
echo         Arg = WScript.Arguments(i)                                                           >>"%noshell%"
echo         If InStr(Arg, " ") ^> 0 or InStr(Arg, "&") ^> 0 Then Arg = chr(34) ^& Arg ^& chr(34) >>"%noshell%"
echo       arr(i) = Arg                                                                           >>"%noshell%"
echo     Next                                                                                     >>"%noshell%"
echo     RunCmd = Join(arr)                                                                       >>"%noshell%"
echo     CreateObject("Wscript.Shell").Run RunCmd, 0 , True                                       >>"%noshell%"
echo End If                                                                                       >>"%noshell%"


:: Add GitHub context menu
set "rtmp=%temp%\github-context-menu--activate.reg"
echo Windows Registry Editor Version 5.00                                                           >"%rtmp%"
echo:                                                                                              >>"%rtmp%"
echo ; Right click on explorer TREE                                                                >>"%rtmp%"
echo [HKEY_CURRENT_USER\Software\Classes\Directory\shell\GitHubDesktopOpenWith]                    >>"%rtmp%"
echo @="Open with GitHub Desktop"                                                                  >>"%rtmp%"
echo "Icon"="%ghexe%,0"                                                                            >>"%rtmp%"
echo:                                                                                              >>"%rtmp%"
echo [HKEY_CURRENT_USER\Software\Classes\Directory\shell\GitHubDesktopOpenWith\command]            >>"%rtmp%"
echo @="WScript \"%noshell%\" \"%ghbat%\" open \"%%1\""                                            >>"%rtmp%"
echo:                                                                                              >>"%rtmp%"
echo ; Right click on explorer main area                                                           >>"%rtmp%"
echo [HKEY_CURRENT_USER\Software\Classes\Directory\Background\shell\GitHubDesktopOpenWith]         >>"%rtmp%"
echo @="Open with GitHub Desktop"                                                                  >>"%rtmp%"
echo "Icon"="%ghexe%,0"                                                                            >>"%rtmp%"
echo:                                                                                              >>"%rtmp%"
echo [HKEY_CURRENT_USER\Software\Classes\Directory\Background\shell\GitHubDesktopOpenWith\command] >>"%rtmp%"
echo @="WScript \"%noshell%\" \"%ghbat%\" open \"%%V\""                                            >>"%rtmp%"

reg import "%rtmp%" > nul 2>&1

echo Enjoy your new menu entry:
echo:
echo ^ ^ ^+^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^+
echo ^ ^ ^|^ ^V^i^e^w^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^>^ ^|
echo ^ ^ ^|^ ^S^o^r^t^ ^B^y^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^>^ ^|
echo ^ ^ ^|^ ^G^r^o^u^p^ ^B^y^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^>^ ^|
echo ^ ^ ^|^ ^R^e^f^r^e^s^h^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^|
echo ^ ^ ^|^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^|
echo ^ ^ ^|^ ^C^u^s^t^o^m^i^z^e^ ^t^h^i^s^ ^f^o^l^d^e^r^.^.^.^ ^ ^ ^|
echo ^ ^ ^|^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^|
echo ^ ^ ^|^ ^P^a^s^t^e^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^|
echo ^ ^ ^|^ ^P^a^s^t^e^ ^S^h^o^r^t^c^u^t^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^|    
echo ^ ^ ^|^ ^O^p^e^n^ ^w^i^t^h^ ^G^i^t^H^u^b^ ^D^e^s^k^t^o^p^ ^ ^ ^|^ ^<^-^-^-
echo ^ ^ ^|^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^|
echo ^ ^ ^|^ ^N^e^w^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^>^ ^|
echo ^ ^ ^|^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^|
echo ^ ^ ^|^ ^P^r^o^p^e^r^t^i^e^s^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^|
echo ^ ^ ^+^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^-^+
echo:

if /i "%comspec% /c ``%~0` `" equ "%cmdcmdline:"=`%" pause