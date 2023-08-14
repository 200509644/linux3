param ( [switch]$system,
	    [switch]$disk,
	    [switch]$network
)
import-module Module200509644.psm1
if ($system -eq $false -and $disk -eq $false -and $network -eq $false) {
cpu11
os11
ram11
video11
disk11
network11
}
else {
if ($system) {
cpu11
os11
ram11
video11
}
if ($disk) {
disk11
}
if ($network) {
network11
}
}
