#!/bin/bash ../.port_include.sh
port=sl
version=git
workdir=sl-master
files="https://github.com/mtoyoda/sl/archive/master.tar.gz sl-git.tar.gz"
depends="ncurses"

build() {
    run ${CC} -I${SERENITY_ROOT}/Root/usr/local/include/ncurses -L${SERENITY_ROOT}/Root/usr/local/lib -o sl sl.c -lncurses -ltinfo
}
