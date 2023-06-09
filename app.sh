#!/bin/bash

while [[ $# -gt 0 ]]; do
    key="$1"

    case $key in
        -s|--sleep)
            sleep="$2"
            shift 2
            ;;
        *)
            echo "Unknown option: $key"
            exit 1
            ;;
    esac
done

# set 4:00 to be the default shut off time
if [ -z $sleep ]; then
  sleep=4
fi

if [ -z "$(command cec-client)"  ]; then
  echo  ""
  echo  "You need to add cec-client before running this"
  echo  ""
  echo  "If you are on Ubuntu you can run:"
  echo  "sudo apt update"
  echo  "sudo apt upgrade"
  echo  "sudo apt install cec-utils"
  echo  ""
  echo  "Stopping.."
  exit 1
fi

echo "CEC TV SLEEPER has started"

while true; do
  echo "Running.."

  power_status=$(echo 'pow 0.0.0.0' | cec-client -s -d 1)
  is_on=false
  if [[ $power_status == *"power status: on"* ]]; then
    is_on=true
  fi

  hours=$(date +%H)
  if [ $sleep == $hours ]; then
    echo "Turning TV OFF.."
    echo "standby 0.0.0.0" | cec-client -s -d 1
  fi

  sleep $((60 * 20))
done