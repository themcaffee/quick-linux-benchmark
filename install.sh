#!/bin/bash

sudo apt-get update

sudo apt-get install -y sysbench mysql apache2-utils

# Speedtest-cli
wget -O speedtest-cli https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py
chmod +x speedtest-cli
