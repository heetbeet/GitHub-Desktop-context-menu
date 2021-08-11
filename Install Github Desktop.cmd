@{' 2>nul&::'=''}>$nul <#
@echo off &setlocal &set "cmdfile=%~dp0%~n0.cmd"
@type "%cmdfile%" | powershell -NoP - 
if /i "%comspec% /c ``%~0` `" equ "%cmdcmdline:"=`%" pause
exit /b %errorlevel%
#>

Echo 'Download and Install Github-Desktop from `central.github.com/deployments/desktop/desktop/latest/win32`'
Echo ''

Invoke-WebRequest -Uri 'https://central.github.com/deployments/desktop/desktop/latest/win32' -OutFile "$env:Temp/github-desktop.exe"
Invoke-WebRequest -Uri 'https://github.com/heetbeet/GitHub-Desktop-context-menu/raw/main/Add%20GitHub-Desktop%20context%20menu.cmd' -OutFile "$env:Temp/add-context-menu.cmd"

& "$env:Temp/github-desktop.exe"   | Out-Null
& "$env:Temp/add-context-menu.cmd" | Write-Output


Remove-Item -Path "$env:Temp/github-desktop.exe" -Force
Remove-Item -Path "$env:Temp/add-context-menu.cmd" -Force