<#
.SYNOPSIS
    Skript zum erstellen eines TestFiles Verzeichnises
#>
[cmdletBinding()]
param(

[ValidateScript({Test-Path -Path $PSItem -PathType 'Container'})]
[Parameter(Mandatory=$true)]
[string]$Path,

[ValidateLength(3,20)]
[string]$DirName = "TestFiles",

[ValidateRange(0,50)]
[int]$DirCount = 3,

[ValidateRange(1,50)]
[int]$FileCount = 9,

[switch]$Force

)
Write-Progress -Id 0 -Activity "Erzeugen des Verzeichnises" -PercentComplete 1
if($Path.EndsWith('\'))
{
    [string]$Testfilespath = $Path + $DirName
}
else
{
    [string]$Testfilespath = $Path + "\" + $DirName
}

Write-Progress -Id 0 -Activity "Erzeugen des Verzeichnises" -Status "Beginn" -PercentComplete 10

if(Test-Path -Path $Testfilespath)
{
    if($Force)
    {
        Write-Verbose -Message "Der Ordner existiert bereits wird aber gelöscht"
        Remove-Item -Path $Testfilespath -Recurse -Force
    }
    else
    {
        Write-Host -Object "Ordner bereits vorhanden" -ForegroundColor Red
        exit
    }
}

Write-Progress -Id 0 -Activity "Erzeugen des Verzeichnises" -Status "Ordner gelöscht" -PercentComplete 15

$TestFilesDir = New-Item -Path $Path -Name $DirName -ItemType Directory

for($i = 1; $i -le $FileCount; $i++)
{
    Write-Progress -Id 1 -ParentId 0 -Activity "Erzeugen der TestFiles Root1" -Status "Datei $i von $FileCount" -PercentComplete ((100/$FileCount)*$i)

    [string]$FileNumber = "{0:D2}" -f $i
    [string]$FileName = "File" + $FileNumber + ".txt" 

    New-Item -Path $TestFilesDir.FullName -Name $FileName -ItemType File
}

for($i = 1; $i -le $DirCount; $i++)
{
    Write-Progress -Id 1 -ParentId 0 -Activity "Erzeugen der Ordner" -Status "Ordner $i von $DirCount" -PercentComplete ((100/$DirCount)*$i)

    [string]$DirNumber = "{0:D2}" -f $i
    [string]$DirName = "Directory" + $DirNumber

    $Dir = New-Item -Path $TestFilesDir.FullName -Name $DirName -ItemType Directory

    for($j = 1; $j -le $FileCount; $j++)
    {
        Write-Progress -Id 2 -ParentId 1 -Activity "Erzeugen der Dateien" -Status "Ordner $j von $FileCount" -PercentComplete ((100/$FileCount)*$j)

        [string]$FileNumber = "{0:D2}" -f $j
        [string]$FileName = "Dir" + $DirNumber + "-" + "File" + $FileNumber + ".txt"

        New-Item -Path $Dir.FullName -Name $FileName -ItemType File
    }
}

Write-Progress -Id 0 -Activity "Erzeugen des Verzeichnises" -Status "fertig" -PercentComplete 100