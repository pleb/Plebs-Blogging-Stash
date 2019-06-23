Set-Location ([System.IO.Path]::GetFullPath((Split-Path $PSCOMMANDPATH)))
[Environment]::CurrentDirectory = ([System.IO.Path]::GetFullPath((Split-Path $PSCOMMANDPATH)))
Import-Module ".\Modules\Use-64Bit.psm1" -Force

$32bitRun = Use-64Bit -PsRootPath $PSHOME -ScriptRootPath $PSScriptRoot -ScriptFilePath $MyInvocation.MyCommand
if ($32BitRun -eq $TRUE) { exit $LastExitCode }

Write-Output { Message = "64 bit ahoy" }