function Set-RegKey($name, $value){
    New-ItemProperty -Path HKLM:\SOFTWARE\ -Name $name -Value $value -PropertyType "string" -ErrorAction Stop | Out-Null 
}
 
function Write-Log($message, $path){
    $CurrentDate = Get-Date -Format yyyymmdd-hh:mm:ss
    $LogEntry = $CurrentDate + " > " + $message
    $LogEntry | Out-File -FilePath $path -Append
    Write-Host $LogEntry
}

$register_keys = @{"Test-Version"="2.0"; "Test-Region"="Belgium"}
$log_path = "C:\Users\tartof\Desktop\PowerShell\powershell_lvl2\logfile.log"

forEach ($key in $register_keys.GetEnumerator()){
    try {
        Set-RegKey -name $key.Name -value $key.Value
        Write-Log -message "Création de la clé '$($key.Name)' terminée avec succès" -path $log_path
    }
    catch {
        Write-Log -message "Création de la clé '$($key.Name)' impossible" -path $log_path
    }
    finally {
         Write-Log -message "Fin de la gestion de la clé '$($key.Name)'" -path $log_path
    }
}
