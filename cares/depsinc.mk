<$cares_DEPDIR/v.mk

cares_includedir = $cares_DEPDIR/c-ares-$v
cares_libdir = $cares_DEPDIR/c-ares-$v/.libs
DEPS_CFLAGS = $DEPS_CFLAGS -I${cares_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${cares_libdir} -lcares
