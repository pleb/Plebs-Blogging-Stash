Function Use-64Bit {
    [CmdletBinding()]
    [OutputType([Bool])]
    Param (
        [parameter(Mandatory = $True)]
        [String]
        $PsRootPath,
        [parameter(Mandatory = $True)]
        [String]
        $ScriptRootPath,
        [parameter(Mandatory = $True)]
        [String]
        $ScriptFilePath
    )
    Process {
        # Are you running in 32-bit mode?
        #   (\SysWOW64\ = 32-bit mode)
        if ($PsRootPath -like "*SysWOW64*") {
            Write-Warning "Restarting this script under 64-bit Windows PowerShell."

            # Restart this script under 64-bit Windows PowerShell.
            #   (\SysNative\ redirects to \System32\ for 64-bit mode)
            & (Join-Path ($PsRootPath -replace "SysWOW64", "SysNative") powershell.exe) `
                -NonInteractive `
                -NoProfile `
                -File (Join-Path $ScriptRootPath ([System.IO.Path]::GetFileName($ScriptFilePath))) `
                2>&1 | Tee-Object -Variable allOutput

            Write-Host ($allOutput | Format-List | Out-String)

            return $TRUE
        }
        return $FALSE
    }
}