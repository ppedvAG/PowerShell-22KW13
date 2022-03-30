<#
.SYNOPSIS
    Kurzbeschreibung: Frägt Events vom Log Security ab
.DESCRIPTION
    Langbeschreibung: Frägt Anmelde und Abmeldevents ab sowie fehlgeschlagenen Anmeldungen
.PARAMETER EventId
    Hilfe zum Parameter EventID:
    Hier sind folgende Werte gültig:
    4624 | Anmeldung
    4625 | fehlgeschlagene Anmeldung
    4634 | Abmeldung
.EXAMPLE
Get-LogonEvents.ps1 -EventId 4624

   Index Time          EntryType   Source                 InstanceID Message
   ----- ----          ---------   ------                 ---------- -------
   40990 Mrz 30 13:29  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
   40987 Mrz 30 13:28  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
   40984 Mrz 30 13:27  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
   40982 Mrz 30 13:27  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
   40977 Mrz 30 13:26  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
.EXAMPLE
Get-LogonEvents.ps1 -EventId 4624 -Verbose
AUSFÜHRLICH: Das Skript wurde mit folgenden Werten gestartet: 4624 | 5 | localhost

   Index Time          EntryType   Source                 InstanceID Message
   ----- ----          ---------   ------                 ---------- -------
   40990 Mrz 30 13:29  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
   40987 Mrz 30 13:28  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
   40984 Mrz 30 13:27  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
   40982 Mrz 30 13:27  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
   40977 Mrz 30 13:26  SuccessA... Microsoft-Windows...         4624 Ein Konto wurde erfolgreich angemeldet....
.LINK
    https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comment_based_help?view=powershell-5.1
#>
[cmdletBinding()]
param(
[Parameter(Mandatory=$true)]
[int]$EventId,

[int]$Newest = 5,

[string]$Computername = "localhost"
)

Write-Verbose -Message "Das Skript wurde mit folgenden Werten gestartet: $EventId | $Newest | $Computername"

Get-EventLog -LogName Security -ComputerName $Computername | Where-Object EventId -eq $EventId | Select-Object -First $Newest

