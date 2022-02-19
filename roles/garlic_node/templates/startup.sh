#!/bin/bash

# Start the Garlicoin process
/root/garlicoind -conf=/root/garlicoin.conf
sleep 1

# Watch Process
while sleep 60; do
  ps aux | grep garlicoind | grep -q -v grep
  status=$?
  if [ $status -ne 0 ]; then
    echo "Garlicoind process has exited."
    exit 1
  fi
done