#ifndef LIB_TRANSFORM_AFFINE_PASSES_H_
#define LIB_TRANSFORM_AFFINE_PASSES_H_

#include "lib/Transform/Affine/AffineDistributeToMPI.h"

namespace mlir {
namespace topoly {

#define GEN_PASS_REGISTRATION
#include "lib/Transform/Affine/Passes.h.inc"

} // namespace topoly
} // namespace mlir

#endif // LIB_TRANSFORM_AFFINE_PASSES_H_
