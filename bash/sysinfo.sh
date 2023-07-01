#!/bin/bash
source ~/linux3/bash/reportfunctions.sh
errormessage "Script ran at `date`"
while [ $# -gt 0 ]; do
    case $1 in
        -h | --help )
       	    echo "this is help section"
            shift
            ;;
        -v | --verbose)
            shift
            verbose1="true"
            echo "verbose is set to true, user will get full info."
            ;;
        -system | --system)
            computerreport
            osreport
            cpureport
            ramreport
            videoreport
            exit
            ;;
        -disk  | --disk)
            diskreport
            exit
            ;;
        -network | --network)
            networkreport
            exit
            ;;
        * )
            errormessage "$1 not a recognized a valid option"
    esac
    shift
done
if [ $verbose1 -eq "true" ]; then
    errormessage "verbose is enabled."
fi

