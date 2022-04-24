$mypid = Read-Host  "Please enter the PID"
$pstatus = Get-Process | Where-Object { $_.id -eq $mypid } | Select-Object -First 2
if ( !$pstatus )
{
    Write-Output "PID $mypid does not exist"
}
else
{
echo "PID $mypid is still running:"
write-output $pstatus
#Get-Process | Where-Object { $_.id -eq $mypid } | Select-Object -First 2
}
pause