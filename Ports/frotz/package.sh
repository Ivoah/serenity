#!/bin/bash ../.port_include.sh
port=frotz
version=2.52
workdir=frotz-$version
files="https://gitlab.com/DavidGriffith/frotz/-/archive/$version/frotz-$version.zip frotz-$version.zip"
depends="ncurses"

build() {
    run make \
        AR=i686-pc-serenity-ar \
        RANLIB=i686-pc-serenity-ranlib \
        CURSES="ncurses" \
        CURSES_CFLAGS="-I${SERENITY_ROOT}/Root/usr/local/include/ncurses" \
        CURSES_LDFLAGS="-lncurses -ltinfo" \
        nosound
}
