param(
    [string]$SysmonExe = "C:\Tools\Sysmon64.exe",
    [string]$ConfigPath = "..\..\telemetry\windows\sysmon\sysmon-enterprise-baseline.xml"
)

if (!(Test-Path $SysmonExe)) {
    Write-Error "Sysmon executable not found at $SysmonExe"
    exit 1
}

if (!(Test-Path $ConfigPath)) {
    Write-Error "Sysmon config not found at $ConfigPath"
    exit 1
}

& $SysmonExe -accepteula -i $ConfigPath
Write-Host "Sysmon baseline installed with config: $ConfigPath"
