function Set-RegKey($name, $value){
    New-ItemProperty -Path HKLM:\SOFTWARE\ -Name $name -Value $value -PropertyType "string" 
}
 
function Write-Log($message, $path){
    $CurrentDate = Get-Date -Format yyyymmdd-hh:mm:ss
    $LogEntry = $CurrentDate + " > " + $message
    $LogEntry | Out-File -FilePath $path -Append
}

$register_keys = @{"Test-Version"="2.0"; "Test-Region"="Belgium"}
$log_path = "C:\Users\tartof\Desktop\PowerShell\powershell_lvl2\logfile.log"
 
forEach ($key in $register_keys.GetEnumerator()){
    Set-RegKey -name $key.Name -value $key.Value
    Write-Log -message "Key added to register = $($key.Name) : $($key.Value)" -path $log_path
}