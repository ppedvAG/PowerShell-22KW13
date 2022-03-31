[cmdletBinding()]
param(
[Parameter(Mandatory=$true,ValueFromPipeline=$true)]
[string]$Eingabe
)
Begin
{
    Write-Host -Object "Am Anfang einmalig ausgeführt z.B. für Initilisierung von Variablen oder Aufbau von RemoteVerbindungen"
}
Process
{
    Write-Host -Object $Eingabe -ForegroundColor Cyan
}
End
{
    Write-Host -Object "Am Ende einmal ausgeführt, z.B. zum schließen der Verbindungen"
}