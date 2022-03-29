# Lösung zu Lab: Filtern

1. 
```powershell
Get-Service | Where-Object -FilterScript {$PSItem.ServiceName.Length -gt 15}
```

2. 
```powershell
Get-AdUser -Filter {GivenName -eq "Paul"}
```