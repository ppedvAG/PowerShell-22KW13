# Lösung zu Lab: Export Import1

1.
Die Effiziente Moegliche Loesung
```powershell
Get-EventLog -LogName System -Newest 10 | Export-Csv -Path .\Events.csv
```
Weitere Moegliche Loesung 
```powershell
Get-EventLog -LogName System | Select-Object -First 10 | Export-Csv -Path .\Events2.csv
```