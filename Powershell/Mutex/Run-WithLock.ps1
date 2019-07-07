Set-Location ([System.IO.Path]::GetFullPath((Split-Path $PSCOMMANDPATH)))
[Environment]::CurrentDirectory = ([System.IO.Path]::GetFullPath((Split-Path $PSCOMMANDPATH)))
Import-Module ".\Modules\Sample-Module.psm1" -Force

$global:defaultMutexWait = New-TimeSpan -Minutes 1
$global:mutex = New-Object System.Threading.Mutex($false, "ABCCodeDeploy")

try {
    FunctionWithLocking
}
catch {
    Write-Output $_
}
finally {
    $global:mutex.Dispose()
}