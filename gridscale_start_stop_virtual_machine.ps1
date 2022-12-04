<#
   This script will start or stop your Gridscale VM
   Source: https://my.gridscale.io/docs/apis/
#>

$XAuthUserId = "" # Your Griscale user
$XAuthToken = "" # Your Gridscale user token
$Server = ""
$InvokeRequest = "https://api.gridscale.io/objects/servers/" + $Server + "/power" # Gridscale's InvokeRequest
$Power = "true" # true = on / false = off

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("X-Auth-UserId", $XAuthUserId)
$headers.Add("X-Auth-Token", $XAuthToken)
$headers.Add("Content-Type", "application/json")

$body = "{
`n    `"power`": " + $Power + "
`n}"


$response = Invoke-RestMethod $InvokeRequest -Method 'PATCH' -Headers $headers -Body $body