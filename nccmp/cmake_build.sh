declare -a CMAKE_PLATFORM_FLAGS
CMAKE_PLATFORM_FLAGS+=(-DCMAKE_TOOLCHAIN_FILE="${RECIPE_DIR}/cross-linux.cmake")

mkdir build
cd build
cmake \
  -DCMAKE_INSTALL_PREFIX=${PREFIX} \
  -DBUILD_TESTS=ON \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_C_COMPILER=$GCC/bin/gcc \
  -DCMAKE_EXE_LINKER_FLAGS="-L$HDF/lib -lhdf5 -lhdf5_hl -L$NC/lib -lcurl" \
  -DCMAKE_INSTALL_PREFIX=path/to/install/dir \
  -DCMAKE_VERBOSE_MAKEFILE=OFF \
  -DNETCDF_INC_DIR=$NC/include \
  -DNETCDF_LIB_PATH=$NC/lib/libnetcdf.a \
  -DWITH_NETCDF=$NC/src \
  -${CMAKE_PLATFORM_FLAGS[@]} 
  ..

make -j
ctest
make install

