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
#FunktionDeklaration
function New-TestFiles
{
[cmdletBinding()]
param(
[ValidateScript({Test-Path -Path $PSItem -PathType 'Container'})]
[Parameter(Mandatory=$true)]
[string]$Path,

[ValidateRange(1,50)]
[int]$FileCount = 9,

[ValidateLength(3,20)]
[string]$FileBaseName = "File"
)

for($i = 1; $i -le $FileCount; $i++)
{
    [string]$FileNumber = "{0:D2}" -f $i
    [string]$FileName = "$FileBaseName" + $FileNumber + ".txt" 

    New-Item -Path $Path -Name $FileName -ItemType File |Out-Null
}

}
#

if($Path.EndsWith('\'))
{
    [string]$Testfilespath = $Path + $DirName
}
else
{
    [string]$Testfilespath = $Path + "\" + $DirName
}

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

$TestFilesDir = New-Item -Path $Path -Name $DirName -ItemType Directory

New-TestFiles -Path $TestFilesDir.FullName -FileBaseName "File" -FileCount $FileCount

for($i = 1; $i -le $DirCount; $i++)
{
    [string]$DirNumber = "{0:D2}" -f $i
    [string]$DirName = "Directory" + $DirNumber

    $Dir = New-Item -Path $TestFilesDir.FullName -Name $DirName -ItemType Directory

    New-TestFiles -Path $Dir.FullName -FileBaseName "Dir$DirNumber-File" -FileCount $FileCount

}

