Set-Location ([System.IO.Path]::GetFullPath((Split-Path $PSCOMMANDPATH)))
[Environment]::CurrentDirectory = ([System.IO.Path]::GetFullPath((Split-Path $PSCOMMANDPATH)))
Import-Module ".\Modules\Use-Object.psm1" -Force

$ConnectionString = "Data Source=(localdb)\MSSQLLocalDB;Integrated Security=True"
$Query = "SELECT 'Hello from SQL Server' AS result"

Use-Object ($connection = New-Object -TypeName "System.Data.SqlClient.SqlConnection" -ArgumentList $ConnectionString) {
    $connection.Open()

    Use-Object ($command = $connection.CreateCommand()) {
        $command.CommandText = $Query

        Use-Object ($reader = $command.ExecuteReader()) {
            while($reader.Read()) {
                $row = @{}
                for($i = 0; $i -lt $reader.FieldCount; $i++){
                    $colName = $reader.GetName($i)
                    $colValue = $reader.GetValue($i)
                    $row.Set_Item($colName, $colValue)
                }
                # Add to the return
                $row
            }
        }
    }
}