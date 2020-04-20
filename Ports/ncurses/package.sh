#!/bin/bash ../.port_include.sh
port=ncurses
version=6.1
useconfigure=true
configopts="--with-termlib --enable-pc-files --with-pkg-config=/usr/local/lib/pkgconfig --with-pkg-config-libdir=/usr/local/lib/pkgconfig"
files="ftp://ftp.gnu.org/gnu/ncurses/ncurses-${version}.tar.gz ncurses-${version}.tar.gz
http://ftp.gnu.org/gnu/ncurses/ncurses-${version}.tar.gz.sig ncurses-${version}.tar.gz.sig
https://ftp.gnu.org/gnu/gnu-keyring.gpg gnu-keyring.gpg"
auth_type="sig"
auth_opts="--keyring ./gnu-keyring.gpg ncurses-${version}.tar.gz.sig"

post_install() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # Required on macOS because the host tic program puts terminfo files in the wrong directories
        # This hack only helps terminfo files that start with x, but since the SerenityOS terminal
        # impersonates xterm this is all we need (for now). Ideally we would be able to move all
        # directories to their proper name but the required directory structure has overlapping 
        # folder names with different cases and macOS volumes are case-insensitive by default.
        mv ${SERENITY_ROOT}/Root/usr/local/share/terminfo/78 ${SERENITY_ROOT}/Root/usr/local/share/terminfo/x
    fi
}
