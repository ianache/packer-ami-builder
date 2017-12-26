

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$wclient = New-Object System.Net.WebClient
$wclient.DownloadFile('https://dl.bitvise.com/BvSshServer-Inst.exe', 'C:\Windows\Temp\BvSshServer-Inst.exe')
$wclient.DownloadFile('https://gist.githubusercontent.com/lmayorga1980/a302aa825356eb0de032034ca4d5e2b1/raw/965cf5bc7c857678dd51a6ae07e3bc6d970bed8b/Bitvise-SSH.wst', 'C:\Windows\Temp\BvSettings.wst')

C:\Windows\Temp\BvSshServer-Inst.exe -defaultInstance -acceptEULA -settings=C:\Windows\Temp\BvSettings.wst  -startService
