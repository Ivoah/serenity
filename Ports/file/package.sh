#!/bin/bash ../.port_include.sh
port=file
version=5.33
useconfigure="true"
files="ftp://ftp.astron.com/pub/file/file-${version}.tar.gz file-${version}.tar.gz"
depends="pcre2"

configure() {
    run ./"$configscript" --host=i686-pc-serenity LDFLAGS="-lpcre2-posix -lpcre2-8"
}
