TARG = xorgxf86dgaproto

<$mkbuild/mk.common-noinst

xorgxf86dgaproto:QV:
	./configure \
		--prefix="$prefix" \
		--mandir="$ROOT/share/man"
	make -j$nprocs
	make install DESTDIR="`pwd`/lib"