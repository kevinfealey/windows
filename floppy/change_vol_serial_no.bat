if not exist "C:\Program Files\7-Zip\7z.exe" (
    powershell -Command "(New-Object System.Net.WebClient).DownloadFile('http://www.7-zip.org/a/7z920-x64.msi', 'C:\Windows\Temp\7z920-x64.msi')" <NUL
	msiexec /qb /i C:\Windows\Temp\7z920-x64.msi
)

if not exist "C:\Windows\Temp\VolumeId.zip" (
    powershell -Command "(New-Object System.Net.WebClient).DownloadFile('https://download.sysinternals.com/files/VolumeId.zip', 'C:\Windows\Temp\VolumeId.zip')" <NUL
)

cmd /c ""C:\Program Files\7-Zip\7z.exe" xy C:\Windows\Temp\VolumeId.zip -oC:\Windows\Temp"

cmd /c %SystemRoot%\System32\reg.exe ADD HKCU\Software\Sysinternals\VolumeId /v EulaAccepted /t REG_DWORD /d 1 /f
cmd /c C:\Windows\Temp\VolumeId\Volumeid.exe C: F0D1-23DC

msiexec /qb /x C:\Windows\Temp\7z920-x64.msi