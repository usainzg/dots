// RUN: topoly-opt %s --affine-distribute-to-mpi > %t
// RUN: FileCheck %s < %t

func.func @compute_matrix(%A: memref<100x100xf32>) {
  affine.for %i = 0 to 100 {
    affine.for %j = 0 to 100 {
      %val = affine.load %A[%i, %j] : memref<100x100xf32>
      %result = arith.addf %val, %val : f32
      affine.store %result, %A[%i, %j] : memref<100x100xf32>
    }
  }
  return
}