

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Install Visual Studio Code
Invoke-WebRequest -Uri "https://aka.ms/win32-x64-user-stable" -OutFile "$ENV:UserProfile\Downloads\VSCodeUserSetup-x64.exe"
& "$ENV:UserProfile\Downloads\VSCodeUserSetup-x64.exe"


function Get-Installer() {
  param(
    [Parameter(Mandatory = $true, Position = 0)]
    [uri] $url,

    [Parameter(Mandatory = $true, Position = 1)]
    [string] $path,
  )

  try {
    Invoke-WebRequest -Uri "$url" -OutFile "$path"
    Start-Process -Wait "$path"
  }

}
