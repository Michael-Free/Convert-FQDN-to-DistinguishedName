function ConvertTo-DistinguishedName {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$DomainName
    )

    process {
        try {
            $dnParts = $DomainName -split '\.' | ForEach-Object { "dc=$_" }
            $distinguishedName = $dnParts -join ','
            return $distinguishedName
        } catch {
            Write-Error "An error occurred while converting the domain name to distinguished name: $_"
        }
    }
}
