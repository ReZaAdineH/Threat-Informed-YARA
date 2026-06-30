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

Write-Host "Installing or updating Sysmon with: $ConfigPath"
& $SysmonPath -accepteula -i $ConfigPath
if ($LASTEXITCODE -ne 0) {
    Write-Host "Install may have failed or Sysmon may already be installed. Trying config update..."
    & $SysmonPath -c $ConfigPath
}
