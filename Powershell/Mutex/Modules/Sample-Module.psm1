function FunctionWithLocking {
    begin { 
        $global:mutex.WaitOne($defaultMutexWait) | Out-Null
    }
    process {
        Write-Output "Function with locking was executed."
    }
    end {
        $global:mutex.Dispose()
    }
}
  
