include ../../Makefile.def
include ../../Makefile.conf

install: lib/libHYPRE.a

lib/libHYPRE.a:
	tar -xzf hypre-2.7.0b.tar.gz
	cd hypre-2.7.0b/src; \
		mv configure configure.orig; \
		cp ../../configure.hypre-2.7.0b.fixed configure; \
		./configure --without-fei \
			CC=${COMPILE.mpicc} CXX=${COMPILE.c}; \
		make -j4 install
	ln -s hypre-2.7.0b/src/hypre/lib .
	ln -s hypre-2.7.0b/src/hypre/include .

distclean:
	rm -rf hypre-2.7.0b lib include *~
