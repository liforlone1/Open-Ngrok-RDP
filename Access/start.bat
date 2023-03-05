@echo off
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" > masgeeror.txt 2>&1
net config server /srvcomment:"Windows Server By Administration" > masgeeror.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > masgeeror.txt 2>&1
net user Administration Admi$2314 /add >nul
net localgroup administrators Administration /add >nul
net user Administration /active:yes >nul
net user installer /delete
diskperf -Y >nul
sc config Audiosrv start= auto >nul
sc start audiosrv >nul
ICACLS C:\Windows\Temp /grant Administration:F >nul
ICACLS C:\Windows\installer /grant Administration:F >nul
echo Successfully installed! If RDP is dead, rebuild again.
echo IP:
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Failed to retreive NGROK authtoken - check again your authtoken"
echo Username: Administration
echo Password: Admin2314
echo You can login now!
ping -n 10 127.0.0.1 >nul
