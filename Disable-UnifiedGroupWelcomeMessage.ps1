<#
    For disabling the system-generated welcome messages sent to users who are added as members to the Office 365 Group. Must be run with a global admin account.
#>

$GroupName = "GroupName"

<# Using $cred below functions the same as this
$UserCredential = Get-Credential
$Session = New-PSSession -ConfigurationName "Microsoft.Exchange" -ConnectionUri "https://outlook.office365.com/powershell-liveid/" -Credential $UserCredential -Authentication "Basic" -AllowRedirection
#>
$Session = New-PSSession -ConfigurationName "Microsoft.Exchange" -ConnectionUri "https://outlook.office365.com/powershell-liveid/" -Credential $cred -Authentication "Basic" -AllowRedirection
Import-PSSession $Session -DisableNameChecking | Out-Null

Set-UnifiedGroup $GroupName -UnifiedGroupWelcomeMessageEnabled:$false

Remove-PSSession $Session