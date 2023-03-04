@echo off
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" 
net config server /srvcomment:"Windows Server By FutureBrightBD" 
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F
net user FutureBrightBD P@s$Wr9! /add >nul
net localgroup administrators FutureBrightBD/add >nul
net user FutureBrightBD/active:yes >nul
net user installer /delete
diskperf -Y >nul
sc config Audiosrv run= auto >nul
sc start audiosrv >nul
ICACLS C:\Windows\Temp /grant FutureBrightBD:F >nul
ICACLS C:\Windows\installer /grant FutureBrightBD:F >nul
echo Successfully installed! If RDP is dead, rebuild again.
echo IP:
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Failed to retreive NGROK authtoken - check again your authtoken"
echo Username: FutureBrightBD
echo Password: P@s$Wr9!
echo You can login now!
ping -n 10 127.0.0.1 >nul
