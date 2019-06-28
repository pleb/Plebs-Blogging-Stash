Function Use-Object {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [AllowEmptyString()]
        [AllowEmptyCollection()]
        [AllowNull()]
        [Object]
        $InputObject,
        [Parameter(Mandatory = $true)]
        [scriptblock]
        $ScriptBlock
    )
    Process {
        try {
            . $ScriptBlock
        }
        finally {
            if ($null -ne $InputObject -and $InputObject -is [System.IDisposable]) {
                $InputObject.Dispose()
            }
        }
    }
}