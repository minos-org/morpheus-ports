TARG = libpthreadstubs

<$mkbuild/mk.common-noinst

libpthreadstubs:QV:
	CC="$CC" ./configure \
		--prefix="$PREFIX" \
		--disable-shared \
		--enable-static
	make -j$nprocs
	# install lib for use as a dependency.
	make -j$nprocs install DESTDIR=`pwd`/lib
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;
