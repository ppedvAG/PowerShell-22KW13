# Lösung zu Lab: PipeLine 1

1.
```powershell
Get-ADUser -Filter * | Format-Wide -Property SurName
```
oder etwas schöner mit
```powershell
Get-ADUser -Filter * | Format-Wide -Property SurName -AutoSize
```

2.
```powershell
Get-ADUser -Filter * | Sort-Object -Property GivenName | Format-Table
```
oder etwas schöner mit
```powershell
Get-ADUser -Filter * | Sort-Object -Property GivenName | Format-Table -Property GivenName,Surname,Name
```
3.
"PowerShell Methode"
```powershell
Get-ADGroup -Filter * | Measure-Object
```
".Net Methode"
```powershell
(Get-ADGroup -Filter *).count
```
4.
```powershell
Get-ADUser -Filter * | Select-Object -Last 3
``` 