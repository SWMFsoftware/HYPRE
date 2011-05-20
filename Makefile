include ../../Makefile.def
include ../../Makefile.conf

install:
	tar -xzf hypre-2.7.0b.tar.gz
	cd hypre-2.7.0b/src; \
		./configure --without-fei \
			CC=${COMPILE.c} CXX=${COMPILE.c}; \
		make install
	ln -s hypre-2.7.0b/src/lib .
	ln -s hypre-2.7.0b/src/include .

distclean:
	rm -rf hypre-2.7.0b lib include *~
