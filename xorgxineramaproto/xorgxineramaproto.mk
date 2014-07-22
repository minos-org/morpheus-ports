TARG = xorgxextproto

<$mkbuild/mk.common-noinst

xorgxextproto:QV:
    ./configure \
        --build="${TOOLCHAIN_TRIPLET}" \
        --host="${HOST_TOOLCHAIN_TRIPLET}" \
        --prefix="$PREFIX" \
        --mandir="$ROOT/share/man"
    make -j$nprocs
    make install DESTDIR="`pwd`/lib"
