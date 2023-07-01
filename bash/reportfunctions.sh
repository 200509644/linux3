#!/bin/bash

cpureport () {
# title
echo "This is the CPU report:"
# labeled data showing:
echo "CPU manufacturer and model is:"
cpumanufacturer=$(lscpu | grep "Vendor ID:" | awk '{print $3}')
cpumodel=$(lscpu | grep "Model name:" | awk '{print $3,$4,$5,$6,$7,$8,$9,$10}')
echo "$cpumanufacturer"
echo "$cpumodel"
echo "CPU architecture is: `lscpu | grep "Architecture:" | awk '{print $2}'`"
echo "CPU core count is: `nproc`"
mhz=$(lscpu | grep "BogoMIPS" | awk '{print $NF}')
ghz=$(echo "scale=2; $mhz/1000" | bc)
echo "CPU maximum speed in a human friendly format: $ghz Ghz"
echo "Sizes of caches (L1, L2, L3) in a human friendly format:"
echo "L1d: `lscpu|grep "L1d:"|awk '{print $2}'`"
}

computerreport () {
# title
echo "This is computer report:"
# labeled data showing:
echo "Computer manufacturer `sudo dmidecode -s system-manufacturer`"
echo "Computer description or model : `sudo dmidecode -s system-product-name`"
echo "Computer serial number is: `sudo dmidecode -s system-serial-number`"
}

osreport () {
# title
echo "This is os report:"
# labeled data showing:
echo "Linux distro: `hostnamectl | awk '/Operating System/ {print $3}'`"
echo "Distro version `hostnamectl | awk '/Operating System/ {print $4,$5,$6,$7,$8,$9}'`"
}

ramreport () {
#title
echo "This is RAM report:"
#labeled data showing:
#a table of the installed memory components with each table row having:
##Component manufacturer
##Component model or product name

##Component speed in a human friendly format
##Component physical location in a human friendly format : `sudo dmidecode --type 17 | grep -i "locator"`
echo "Total size of installed RAM in a human friendly format `free -h | grep Mem | awk '{print $2}'` "
}

videoreport () {
#title
echo "This is video report:"
#labeled data showing:
echo "Video card/chipset manufacturer and Video car/chipset decription or model is: "
vid=$(lspci | grep "VGA" | awk '{print $1}')
lspci -v -s $vid
}

diskreport () {
#title
echo "This is disk report:"
#labeled data showing:
#a table of the installed disk drives with each table row having:
##Drive manufacturer
##Drive model
##Drive size in a human friendly format
##Partition number
##Mount point if mounted
##Filesystem size in a human friendly format if filesystem is mounted
##Filesystem free space in a human friendly format if filesystem is mounted#
}

networkreport () {
#title
echo "This is network report:"
#labeled data showing:
#a table of the installed installed network interfaces (including virtual devices) with each table row having:
##Interface manufacturer
##Interface model or description
##Interface link state
##Interface current speed
##Interface IP addresses in CIDR format if configured
##Interface bridge master if part of a bridge
##DNS server(s) and search domain(s) if any are associated with the interface

}

errormessage () {
# saves the error message with a timestamp into a logfile named /var/log/systeminfo.log
echo "error found:"
echo "$1" >> /var/log/systeminfo.log
}





