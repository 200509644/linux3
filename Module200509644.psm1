function cpu11 {Get-WmiObject Win32_Processor};

function os11 {Get-WmiObject Win32_OperatingSystem};

function ram11 {Get-WmiObject Win32_PhysicalMemory | Select-Object Manufacturer, PartNumber, Capacity, Speed};

function video11 {get-wmiobject -class win32_videocontroller | Select-Object Name, VideoModeDescription, VideoProcessor};


function disk11 {$diskdrives = Get-CIMInstance CIM_diskdrive
foreach ($disk in $diskdrives) {
    $partitions = $disk|get-cimassociatedinstance -resultclassname CIM_diskpartition
    foreach ($partition in $partitions) {
          $logicaldisks = $partition | get-cimassociatedinstance -resultclassname CIM_logicaldisk
          foreach ($logicaldisk in $logicaldisks) {
                   new-object -typename psobject -property @{Manufacturer=$disk.Manufacturer
                                                             Location=$partition.deviceid
                                                             Drive=$logicaldisk.deviceid
                                                             "Size(GB)"=$logicaldisk.size / 1gb -as [int]
                                                             }
         }
    }
}};

function network11 {Get-CimInstance win32_networkadapterconfiguration | where-object ipenabled -eq enabled };