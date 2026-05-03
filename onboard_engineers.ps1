$OUPath = "OU=Engineering,DC=titan,DC=local"
$Password = ConvertTo-SecureString "TitanStandardPassword123!" -AsPlainText -Force

for ($i = 1; $i -le 5; $i++) {
    $UserName = "Eng_User$i"
    New-ADUser -Name $UserName `
               -SamAccountName $UserName `
               -Path $OUPath `
               -AccountPassword $Password `
               -Enabled $true `
               -ChangePasswordAtLogon $true
}
