include ../../Makefile.def
include ../../Makefile.conf

install: lib/libHYPRE.a

lib/libHYPRE.a:
	rm -rf hypre-2.7.0b lib include
	tar -xzf hypre-2.7.0b.tar.gz
	cd hypre-2.7.0b/src; \
		mv configure configure.orig; \
		cp ../../configure.hypre-2.7.0b.fixed configure; \
		./configure --without-fei \
			CC=${COMPILE.mpicc} CXX=${COMPILE.c}; \
		make -j4 install
	mkdir lib include
	cp hypre-2.7.0b/src/hypre/lib/* lib/
	cp hypre-2.7.0b/src/hypre/include/* include/

distclean:
	rm -rf hypre-2.7.0b *~

uninstall: distclean
	rm -rf lib include

reinstall: uninstall
	make install
