#!/bin/bash

# Display CPU info
cat /proc/cpuinfo

# CPU benchmark
sysbench --test=cpu run

# Memory reads benchmark
sysbench --test=memory run

# Memory writes benchmark
sysbench --test=memory --memory-oper=write run

# File I/O benchmark
sysbench --test=fileio prepare
sysbench --test=fileio --file-test-mode=rndrw run
sysbench --test=fileio cleanup

# MySQL benchmark
mysql -uroot -e "CREATE DATABASE sbtest;"
sysbench --test=oltp --oltp-table-size=1000000 --mysql-user=root prepare
sysbench --test=oltp --oltp-table-size=1000000 --mysql-user=root run
sysbench --test=oltp --oltp-table-size=1000000 --mysql-user=root cleanup

# Apache benchmark
ab -kc 1000 -n 10000 http://127.0.0.1/ab -kc 1000 -n 10000 http://127.0.0.1/

# Speed test
./speedtest-cli --server=7340
