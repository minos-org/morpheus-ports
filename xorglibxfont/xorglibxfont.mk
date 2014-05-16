TARG = xorglibxfont
DEPS = freetype zlib xorgxproto xorglibfontenc xorgxtrans xorgfontsproto

<$mkbuild/mk.common-noinst

xorglibxfont:QV:
	# patch "error: conflicting types for ‘CacheFontPattern’"
	patch -p1 -i ../xorg-libxfont-const.diff
	#
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	export FREETYPE_CFLAGS="-I${freetype_includedir}"
	export FREETYPE_LIBS="-L${freetype_libdir} -lfreetype"
	export XFONT_CFLAGS=" "
	export XFONT_LIBS=" "
	CC="$CC" ./configure \
		--prefix="$prefix" --mandir="$ROOT/share/man" \
		--disable-shared \
		--enable-static
	make -j$nprocs install DESTDIR="`pwd`/lib"
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;
