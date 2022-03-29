$a = "<style>"
$a = $a + "BODY{background-color:red;}"
$a = $a + "TABLE{border-width 1px;border-Style: solid; border-color: black ;border-collapse: collapse;}"
$a = $a + "TH{border-width 3px;padding: 0px; border-Style: solid; border-color: yellowgreen; background-color: thistle }"
$a = $a + "TD{border-width 3px;padding: 0px; border-Style: solid; border-color: palegoldenrod; background-color: peachpuff }"
$a = $a + "</style>"

$mailbody = Get-Service | Sort-Object -Property Status,Displayname | Select-Object -Property Status,Name,Displayname | ConvertTo-Html -Head $a -Body "<h1>Dienst Infos </h1>" 

Send-MailMessage -BodyAsHtml -Body $mailbody -SmtpServer -Credential -Port -To -Subject -UseSsl 