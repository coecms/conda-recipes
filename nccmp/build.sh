# export CXXFLAGS="-fPIC -DPIC -g -O2 -std=c++11 -fopenmp ${CFLAGS}"
export CFLAGS="-I${BUILD_PREFIX}/include -I${BUILD_PREFIX}/include"
export LDFLAGS="-L${BUILD_PREFIX}/lib -lhdf5 ${LDFLAGS}"

./configure --prefix=${PREFIX} --enable-test-big

make -j
make check
make install-strip
