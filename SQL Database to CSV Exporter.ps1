$server = ""
$database = ""
$tablequery = "SELECT s.name as schemaName, t.name as tableName from sys.tables t inner join sys.schemas s ON t.schema_id = s.schema_id"
$DirectoryPath = "C:\Users\MarkusBegerow\mycsv\"

# Declare Connection Variables
$connectionTemplate = "Data Source={0};Integrated Security=SSPI;Initial Catalog={1};"
$connectionString = [string]::Format($connectionTemplate, $server, $database)
$connection = New-Object System.Data.SqlClient.SqlConnection
$connection.ConnectionString = $connectionString

$command = New-Object System.Data.SqlClient.SqlCommand
$command.CommandText = $tablequery
$command.Connection = $connection

# Load up the Tables in a dataset
$SqlAdapter = New-Object System.Data.SqlClient.SqlDataAdapter
$SqlAdapter.SelectCommand = $command
$DataSet = New-Object System.Data.DataSet
$SqlAdapter.Fill($DataSet)
$connection.Close()

# Function to write data to CSV without quotes
function Write-DataTableToCsv {
    param (
        [Parameter(Mandatory=$true)]
        [System.Data.DataTable]$DataTable,

        [Parameter(Mandatory=$true)]
        [string]$FilePath
    )

    $sb = New-Object System.Text.StringBuilder

    # Write column headers
    $columns = $DataTable.Columns | ForEach-Object { $_.ColumnName }
    $sb.AppendLine(($columns -join ","))

    # Write rows
    foreach ($row in $DataTable.Rows) {
        $values = $row.ItemArray | ForEach-Object { $_.ToString() }
        $sb.AppendLine(($values -join ","))
    }

    # Write to file
    [System.IO.File]::WriteAllText($FilePath, $sb.ToString())
}

# Loop through all tables and export a CSV of the Table Data
foreach ($Row in $DataSet.Tables[0].Rows) {
    $queryData = "SELECT * FROM [$($Row[0])].[$($Row[1])]"

    # Specify the output location of your dump file
    $extractFile = $DirectoryPath + "$($Row[0])_$($Row[1]).csv"

    $command.CommandText = $queryData
    $command.Connection = $connection

    $SqlAdapter = New-Object System.Data.SqlClient.SqlDataAdapter
    $SqlAdapter.SelectCommand = $command
    $DataSet = New-Object System.Data.DataSet
    $SqlAdapter.Fill($DataSet)
    $connection.Close()

    # Write the data to CSV without quotes
    Write-DataTableToCsv -DataTable $DataSet.Tables[0] -FilePath $extractFile
}
