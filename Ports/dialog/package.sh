#!/bin/bash ../.port_include.sh
port=dialog
version=0j03_0_37
workdir=$port-$version/src
files="https://hd0.linusakesson.net/files/dialog-${version}.zip dialog-${version}.zip"
makeopts="CC=$CC"
