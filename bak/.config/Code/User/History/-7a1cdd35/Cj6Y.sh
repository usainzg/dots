#!/bin/bash

BUILD_SYSTEM="Ninja"
# BUILD_DIR=./build-`echo ${BUILD_SYSTEM}| tr '[:upper:]' '[:lower:]'`
BUILD_DIR=./build-ninja

rm -rf $BUILD_DIR
mkdir $BUILD_DIR
pushd $BUILD_DIR

LLVM_BUILD_DIR=externals/llvm-project/build
cmake -G $BUILD_SYSTEM .. \
    -DCMAKE_CXX_COMPILER="$(which clang++)" \
    -DCMAKE_C_COMPILER="$(which clang)" \
    -DLLVM_DIR="$LLVM_BUILD_DIR/lib/cmake/llvm" \
    -DMLIR_DIR="$LLVM_BUILD_DIR/lib/cmake/mlir" \
    -DBUILD_DEPS="ON" \
    -DBUILD_SHARED_LIBS="OFF" \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

popd

cmake --build $BUILD_DIR --target MLIRAffineDistributeToMPIPasses
cmake --build $BUILD_DIR --target mlir-headers
cmake --build $BUILD_DIR --target mlir-doc
cmake --build $BUILD_DIR --target topoly-opt
cmake --build $BUILD_DIR --target check-topoly
