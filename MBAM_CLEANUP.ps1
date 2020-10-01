<#   
.SYNOPSIS   
    Script to remove the Malwarebytes Managed Client
.DESCRIPTION 
    The script will uninstall the application through WMI and delete it from the software directory. 
    script also has built in logining   
.NOTES   
    Name: WSUS Sustainment Program
    Author: StrayTripod
    Modifier: N/A
    DateCreated: 10 1 2020
    DateModifed: 10/1/2020
    
    Warning: Use this at you own risk! Make backups! Create snapshots! I am not responsible for any issues that arise due to the use of this program by anyone other then me.
    I recommend reading the script in full below, before proceeding.      

.REFERANCE  
   None
.DEPENDANCIES
    PowerShell
#> 

$log = '.\App_remove.log'
$date = date
$MBAM = Get-WmiObject Win32_Product | Where-Object {$_.IdentifyingNumber -eq '{9D909EDF-87CC-4D34-9A92-30FBF866B9AC}'}
$Dir = Test-path -path "C:\Program Files (x86)\Malwarebytes' Managed Client"
$AppDir = "C:\Program Files (x86)\Malwarebytes' Managed Client"
if ($MBAM) {$MBAM.Uninstall(); 
Write-output "$date $env:COMPUTERNAME -- The Application was removed from WMI" >> $log
} else {Write-output "$date $env:COMPUTERNAME -- Application not found" >> $log}

if ($Dir -eq 'True') {del -Recurse $AppDir;
        Write-output "$date $env:COMPUTERNAME -- The Application directory was removed." >> $log}
        else {Write-output "$date $env:COMPUTERNAME -- Application install directory not found" >> $log}
