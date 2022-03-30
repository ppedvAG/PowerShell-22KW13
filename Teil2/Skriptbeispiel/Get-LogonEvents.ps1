[cmdletBinding()]
param(
[Parameter(Mandatory=$true)]
[int]$EventId,

[int]$Newest = 5,

[string]$Computername = "localhost"
)

Write-Verbose -Message "Das Skript wurde mit folgenden Werten gestartet: $EventId | $Newest | $Computername"

Get-EventLog -LogName Security -ComputerName $Computername | Where-Object EventId -eq $EventId | Select-Object -First $Newest

