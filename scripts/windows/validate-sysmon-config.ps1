param(
    [string]$SysmonPath = ".\Sysmon64.exe",
    [string]$ConfigPath = "telemetry\windows\sysmon\sysmon-enterprise-baseline.xml"
)

if (-not (Test-Path $SysmonPath)) {
    Write-Error "Sysmon executable not found: $SysmonPath"
    exit 1
}

if (-not (Test-Path $ConfigPath)) {
    Write-Error "Sysmon config not found: $ConfigPath"
    exit 1
}

& $SysmonPath -c $ConfigPath
