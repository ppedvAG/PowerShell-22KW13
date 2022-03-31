
function Test-Confirm
{
[cmdletBinding(PositionalBinding=$false,SupportsShouldProcess=$true,ConfirmImpact = "Low")]
param(
[Parameter(Mandatory=$true, Position=0)]
[string]$Eingabe1
)

    if($PSCmdlet.ShouldProcess($Eingabe1))
    {
        Write-Host -Object $Eingabe1
    }

}

function Test-PipeLineByValue
{
[cmdletBinding()]
param(
[Parameter(Mandatory=$true,ValueFromPipeLine=$true)]
[string]$Eingabe1
)
Write-Host -Object $Eingabe1 -ForegroundColor Magenta
}

function Test-PipeLineByPropertyName
{
[cmdletBinding()]
param(
[Parameter(Mandatory=$true,ValueFromPipeLineByPropertyName=$true)]
[string]$Name

)
Write-Host -Object $Name -ForegroundColor Magenta
}

function Test-MandatoryHelpMessage
{
[cmdletBinding()]
param(
[Parameter(Mandatory=$true,HelpMessage="Wert der ausgegeben werden soll")]
[string]$Eingabe
)

Write-Host -Object $Eingabe -ForegroundColor Green
}

function Test-ParameterSets
{
[cmdletBinding(DefaultParameterSetName="Text")]
param(
[Parameter(Mandatory=$true,ParameterSetName="Text")]
[string]$texteingabe ="",

[Parameter(Mandatory=$true,ParameterSetName="Zahl")]
[int]$zahleneingabe = "",

[Parameter(Mandatory=$true,ParameterSetName="Text")]
[Parameter(Mandatory=$false,ParameterSetName="Zahl")]
[string]$color = "green"

)

Write-Host -Object ($texteingabe + $zahleneingabe) -ForegroundColor $color

}