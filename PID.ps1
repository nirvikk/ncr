<#
$mypid = Read-Host  "Please enter the PID"
get-process -id '$mypid'
cmd /c pause
#>
$mypid = Read-Host  "Please enter the PID"
$pstatus = Get-Process | Where-Object { $_.id -eq $mypid } | Select-Object -First 1
if ( !$pstatus )
{
    Write-Output "PID $mypid does not exist"
}
else
{
Write-Output "PID $mypid is still running:"
return $pstatus
}
cmd /c pause