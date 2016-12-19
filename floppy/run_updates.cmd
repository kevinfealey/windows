echo ==^> Installing Windows Updates
powershell -File a:\win-updates.ps1 <NUL
@if errorlevel 1 echo ==^> WARNING: Error %ERRORLEVEL% was returned by: powershell -File a:\win-updates.ps1
