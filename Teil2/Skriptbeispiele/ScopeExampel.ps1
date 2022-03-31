
$a = "Vor Ausführung"

function Test-Scope($eingabe)
{
    $a = $eingabe

    Write-Host -Object $a -ForegroundColor Magenta

    return $a
}

$a = Test-Scope -eingabe "Funktionsauführung"
Write-Host -ForegroundColor Green -Object $a
