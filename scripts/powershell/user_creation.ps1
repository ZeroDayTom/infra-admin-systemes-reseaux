<#
=====================================================
 User Creation Script - Enterprise Lab
 Author: Your Name
 Description:
   This script creates a new Active Directory user
   and adds the user to a specified security group.
=====================================================
#>

# Import Active Directory module
Import-Module ActiveDirectory

# ==========================
# Variables
# ==========================

$FirstName = "John"
$LastName = "Doe"
$SamAccountName = "jdoe"
$UserPrincipalName = "jdoe@enterprise.local"
$OU = "OU=Users,DC=enterprise,DC=local"
$Group = "Employees"

# Secure password
$Password = ConvertTo-SecureString "P@ssw0rd123!" -AsPlainText -Force

# ==========================
# Create User
# ==========================

Try {
    New-ADUser `
        -Name "$FirstName $LastName" `
        -SamAccountName $SamAccountName `
        -UserPrincipalName $UserPrincipalName `
        -Path $OU `
        -AccountPassword $Password `
        -Enabled $true `
        -ChangePasswordAtLogon $true

    Write-Host "User $SamAccountName created successfully." -ForegroundColor Green
}
Catch {
    Write-Host "Error creating user: $_" -ForegroundColor Red
    Exit 1
}

# ==========================
# Add user to group
# ==========================

Try {
    Add-ADGroupMember -Identity $Group -Members $SamAccountName
    Write-Host "User added to group $Group." -ForegroundColor Green
}
Catch {
    Write-Host "Error adding user to group: $_" -ForegroundColor Red
    Exit 1
}

Write-Host "User creation process completed successfully."