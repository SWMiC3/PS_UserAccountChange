$30MinutesAgo = [DateTime]::Now.AddMinutes(-30)
$messageParameters = @{ 
Subject = "AD User Account modifed" 
Body = get-winevent -FilterHashtable @{logname="security"; id=4738} | select -first 1 | Format-List | Out-String
From = "ADServer@domain.com" 
To = "adminalerts@domain.com"
SmtpServer = "smtp.domian.com" 
} 
Send-MailMessage @messageParameters
