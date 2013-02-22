#!/bin/bash

version=`sw_vers -productVersion`

printf "version $version was detected\n"

if [[ $(echo "$version" | grep -E '^10.4.[0-9]+$')  ]]; then
    
    printf "running sudo lookupd -flushcache\n"
    
    sudo lookupd -flushcache

elif [[ $(echo "$version" | grep -E '^10.[5|6].[0-9]+$')  ]]; then

    printf "sudo dscacheutil -flushcache\n"
    
    sudo dscacheutil -flushcache

elif [[ $(echo "$version" | grep -E '^10.[7|8].[0-9]+$')  ]]; then
    
    printf "sudo killall -HUP mDNSResponder\n"
    
    sudo killall -HUP mDNSResponder

else
    
    printf "Could not work out the version of OSX - please update this script...\n";

fi
