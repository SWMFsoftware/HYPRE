include ../../Makefile.def
include ../../Makefile.conf

install:
	tar -xzf hypre-2.7.0b.tar.gz
	cd hypre-2.7.0b/src; \
		./configure --without-fei \
			--libdir=${UTILDIR}/HYPRE/lib \
			--includedir=${UTILDIR}/HYPRE/include \
			CC=${COMPILE.c} CXX=${COMPILE.c}; \
		make install

distclean:
	rm -rf hypre-2.7.0b lib include *~
