// RUN: topoly-opt %s --affine-distribute-to-mpi > %t
// RUN: FileCheck %s < %t

func.func @matmul() {
  %A = memref.alloc() : memref<64x64xf32>
  %C = memref.alloc() : memref<64x64xf32>
  %B = memref.alloc() : memref<64x64xf32>

  affine.for %i = 0 to 64 {
    affine.for %j = 0 to 64 {
      affine.for %k = 0 to 64 {
        %0 = affine.load %A[%i, %k] : memref<64x64xf32>
        %1 = affine.load %B[%k, %j] : memref<64x64xf32>
        %2 = arith.mulf %0, %1 : f32
        %3 = affine.load %C[%i, %j] : memref<64x64xf32>
        %4 = arith.addf %2, %3 : f32
        affine.store %4, %C[%i, %j] : memref<64x64xf32>
      }
    }
  }

  return
}
