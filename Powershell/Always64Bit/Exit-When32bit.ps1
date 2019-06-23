if ($PsRootPath -NotLike "*SysWOW64*") {
    Write-Error "Please run this script in a 64bit console"
    exit 1
}

exit 0