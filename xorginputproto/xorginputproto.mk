TARG = xorgkbproto

<$mkbuild/mk.common-noinst

xorgkbproto:QV:
	./configure --prefix="$PREFIX" \
	   --mandir="$ROOT/share/man"
	make -j$nprocs
	make install DESTDIR="`pwd`/lib"
