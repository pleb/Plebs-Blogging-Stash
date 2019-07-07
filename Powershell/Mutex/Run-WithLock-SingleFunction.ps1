function ExampleFunctionWithLocking {
    begin { 
        $defaultMutexWait = New-TimeSpan -Minutes 1
        $mutex = New-Object System.Threading.Mutex($false, "ABCCodeDeploy")
        $mutex.WaitOne($defaultMutexWait) | Out-Null
    }
    process {
        Write-Output "Function with locking was executed."
    }
    end {
        $mutex.Dispose()
    }
}
  
ExampleFunctionWithLocking