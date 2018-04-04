
if "%PUPPET_RELEASE%" equ "enterprise" goto :enterprise
if "%PUPPET_RELEASE%" equ "none" goto :none

goto :done

:enterprise

if not exist "C:\Windows\Temp\puppet.msi" (
  powershell -Command "[Net.ServicePointManager]::ServerCertificateValidationCallback = {$true} ;(New-Object System.Net.WebClient).DownloadFile('http://pm.puppetlabs.com/puppet-agent/%PE_VERSION%/%PE_AGENT_VERSION%/repos/windows/puppet-agent-%PE_AGENT_VERSION%-%PE_ARCH%.msi', 'C:\Windows\Temp\puppet.msi')" <NUL
)

msiexec /qn /i C:\Windows\Temp\puppet.msi PUPPET_AGENT_STARTUP_MODE=disabled PUPPET_MASTER_SERVER=puppetmaster.localdomain  /log C:\Windows\Temp\puppet.log

<nul set /p ".=;C:\Program Files (x86)\Puppet Labs\Puppet\bin" >> C:\Windows\Temp\PATH
set /p PATH=<C:\Windows\Temp\PATH

:none

echo "skipping puppet installation..."


:done

echo "done with provisioning tools"
