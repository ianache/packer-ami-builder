powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('%CHOCO_INSTALL_URL%'))" <NUL

<nul set /p ".=;%ALLUSERSPROFILE%\chocolatey\bin" >> C:\Windows\Temp\PATH
set /p PATH=<C:\Windows\Temp\PATH

