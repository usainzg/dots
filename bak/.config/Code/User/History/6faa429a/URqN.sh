#!/bin/bash

BUILD_SYSTEM=Ninja
BUILD_TAG=ninja
THIRDPARTY_LLVM_DIR=$PWD/externals/llvm-project
BUILD_DIR=$THIRDPARTY_LLVM_DIR/build
INSTALL_DIR=$THIRDPARTY_LLVM_DIR/install

mkdir -p $BUILD_DIR
mkdir -p $INSTALL_DIR

pushd $BUILD_DIR

cmake ../llvm -G $BUILD_SYSTEM \
      -DCMAKE_CXX_COMPILER="$(which clang++)" \
      -DCMAKE_C_COMPILER="$(which clang)" \
      -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR \
      -DLLVM_LOCAL_RPATH=$INSTALL_DIR/lib \
      -DLLVM_TARGETS_TO_BUILD="host" \
      -DLLVM_BUILD_EXAMPLES=ON \
      -DLLVM_INSTALL_UTILS=ON \
      -DCMAKE_BUILD_TYPE=RelWithDebInfo \
      -DLLVM_ENABLE_ASSERTIONS=ON \
      -DLLVM_CCACHE_BUILD=ON \
      -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
      -DLLVM_ENABLE_PROJECTS='mlir' \
      -DLLVM_CCACHE_DIR=$HOME/ccache \
      -DLLVM_ENABLE_LLD=ON \
      -DLLVM_USE_SPLIT_DWARF=ON \
      # -DMLIR_INCLUDE_INTEGRATION_TESTS=ON

cmake --build . --target check-mlir

popd
