set CMAKE_CONFIG=Release

mkdir build_%CMAKE_CONFIG%
pushd build_%CMAKE_CONFIG%

cmake -G "%CMAKE_GENERATOR%" ^
      -DCMAKE_BUILD_TYPE:STRING=%CMAKE_CONFIG% ^
      -DBUILD_SHARED_LIBS:BOOL=ON ^
      -DBUILD_STATIC_LIBS:BOOL=ON ^
      -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
      -DGFLAGS_REGISTER_BUILD_DIR:BOOL=OFF ^
      -DGFLAGS_REGISTER_INSTALL_PREFIX:BOOL=OFF ^
      -DBUILD_gflags_nothreads_LIB:BOOL=OFF ^
      "%SRC_DIR%"

cmake --build . --target install --config %CMAKE_CONFIG%
cd CMakeFiles
type CMakeOutput.log
type CMakeError.log

popd
