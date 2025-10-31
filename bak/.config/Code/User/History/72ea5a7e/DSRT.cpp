#include "lib/Transform/Affine/AffineDistributeToMPI.h"
#include "mlir/Dialect/Affine/Analysis/AffineAnalysis.h"
#include "mlir/Dialect/Affine/Analysis/AffineStructures.h"
#include "mlir/Dialect/Affine/Analysis/Utils.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/MPI/IR/MPI.h"
#include "mlir/Dialect/MemRef/IR/MemRef.h"
#include "mlir/Dialect/SCF/IR/SCF.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/PatternMatch.h"
#include "mlir/IR/Value.h"
#include "mlir/include/mlir/Pass/Pass.h"

namespace mlir {
namespace topoly {

#define GEN_PASS_DEF_AFFINEDISTRIBUTETOMPI
#include "lib/Transform/Affine/Passes.h.inc"

using mlir::affine::AffineForOp;

#define DEBUG_TYPE "affine-distribute-to-mpi"

// A pass that manually walks the IR
struct AffineDistributeToMPI
    : impl::AffineDistributeToMPIBase<AffineDistributeToMPI> {
  using AffineDistributeToMPIBase::AffineDistributeToMPIBase;

  void runOnOperation() {
    func::FuncOp f = llvm::dyn_cast<func::FuncOp>(getOperation());
    if (!f) {
      getOperation()->emitError("Expected a func::FuncOp");
      return signalPassFailure();
    }

    llvm::errs() << "n_ranks=" << n_ranks << "\n";
    if (n_ranks <= 1) {
      f.emitError("n_ranks must be positive");
      return signalPassFailure();
    }

    // print dimension to distribute
    llvm::errs() << "dim=" << dim << "\n";

    // TODO: here we will need to analyze memory acces patterns and generate the
    // correpsonding MPI calls

    // capture affineForOp and walk the IR
    f->walk([&](AffineForOp forOp) {
      // only consider outermost loops
      if (!forOp->getParentOfType<AffineForOp>()) {
        distributeAffineLoop(forOp, n_ranks);
        MutableArrayRef<AffineForOp> input = forOp;
        SmallVector<Operation *, 8> ops(input.begin(), input.end());
        affine::FlatAffineValueConstraints domain;

        // auto indexSet = affine::getIndexSet(ops, &domain);
        // // print domain
        domain.dump();
      }
    });

    // TODO: add mpi finalize before the return?
  }

  void distributeAffineLoop(affine::AffineForOp forOp, int n_ranks) {
    IRRewriter r(forOp->getContext());
    auto ctx = r.getContext();
    Location loc = forOp.getLoc();
    r.setInsertionPoint(forOp);

    Value commWorld = r.create<mpi::CommWorldOp>(loc, mpi::CommType::get(ctx));
    auto rank = r.create<mpi::CommRankOp>(
                     loc, TypeRange{mpi::RetvalType::get(ctx), r.getI32Type()},
                     commWorld)
                    .getRank();
    // rewriter.replaceOpWithNewOp<arith::IndexCastOp>(op,
    // rewriter.getIndexType(), rank);
    //  auto subview = builder.create<memref::SubViewOp>(loc, array, offsets,
    //                                                   dimSizes, strides);
    //  builder.create<memref::CopyOp>(loc, subview, buffer);
    //  builder.create<mpi::SendOp>(loc, TypeRange{}, buffer, tag, to,
    //  commWorld);

    // get mpi retval and i32 types
    // auto mpiRetvalType = builder.getType<mpi::RetvalType>();
    // auto i32Type = builder.getI32Type();

    // auto mpiInit = builder.create<mpi::InitOp>(loc, mpiRetvalType);
    // // get communicator handler
    // auto mpiComm = builder.create<mpi::CommWorldOp>(loc, mpiRetvalType);

    // // get the number of mpi processes and mpi rank
    // auto mpiSize = builder.create<mpi::CommSizeOp>(loc, mpiRetvalType,
    // mpiComm); auto mpiRank = builder.create<mpi::CommRankOp>(loc,
    // mpiRetvalType, mpiComm);

    // // TODO: fix this to get loop bounds (constant or not)
    // assert(forOp.hasConstantLowerBound() &&
    //        "expected input loops to have constant lower bound.");
    // assert(forOp.hasConstantUpperBound() &&
    //        "expected input loops to have constant upper bound.");

    // int64_t lowerBound = forOp.getConstantLowerBound();
    // int64_t upperBound = forOp.getConstantUpperBound();

    // // create values for computation
    // Value vNumRanks = builder.create<arith::ConstantIntOp>(loc, n_ranks, 32);
    // Value vLowerBound = builder.create<arith::ConstantIndexOp>(loc,
    // lowerBound); Value vUpperBound =
    // builder.create<arith::ConstantIndexOp>(loc, upperBound);

    // // number of iterations
    // Value iterationCount = builder.create<arith::SubIOp>(
    //     loc,
    //     builder.create<arith::IndexCastOp>(loc, builder.getI32Type(),
    //                                        vUpperBound),
    //     builder.create<arith::IndexCastOp>(loc, builder.getI32Type(),
    //                                        vLowerBound));
    // // number of iterations per rank
    // Value iterPerRank =
    //     builder.create<arith::DivUIOp>(loc, iterationCount, vNumRanks);

    // // Convert to index type for the loop
    // Value rankIndex = builder.create<arith::IndexCastOp>(
    //     loc, builder.getIndexType(), mpiRank.getRank());
    // Value iterPerRankIndex = builder.create<arith::IndexCastOp>(
    //     loc, builder.getIndexType(), iterPerRank);

    // // Calculate this rank's portion of the loop
    // Value myLowerBound = builder.create<arith::AddIOp>(
    //     loc, vLowerBound,
    //     builder.create<arith::MulIOp>(loc, rankIndex, iterPerRankIndex));

    // Value nextRank = builder.create<arith::AddIOp>(
    //     loc, rankIndex, builder.create<arith::ConstantIndexOp>(loc, 1));

    // Value myUpperBoundTmp =
    //     builder.create<arith::MulIOp>(loc, nextRank, iterPerRankIndex);

    // // The upper bound for the last rank might need adjustment
    // Value isLastRank = builder.create<arith::CmpIOp>(
    //     loc, arith::CmpIPredicate::eq, nextRank,
    //     builder.create<arith::IndexCastOp>(loc, builder.getIndexType(),
    //                                        vNumRanks));

    // Value myUpperBound = builder.create<arith::SelectOp>(
    //     loc, isLastRank, vUpperBound,
    //     builder.create<arith::AddIOp>(loc, vLowerBound, myUpperBoundTmp));

    // // gather all loads and stores in the loop
    // SmallVector<Operation *, 8> loadAndStoreOps;
    // gatherLoadsAndStores(forOp, loadAndStoreOps);

    // // clone the loop with new bounds for this rank
    // // TODO: better to use moveLoopBody(src, dest) instead of cloning?
    // auto newForOp =
    //     cast<affine::AffineForOp>(builder.clone(*forOp.getOperation()));

    // // change the bounds of the new loop
    // // TODO: make this work for every lower/upper bound
    // AffineMap lbMap = builder.getSymbolIdentityMap();
    // newForOp.setLowerBound({myLowerBound}, lbMap);
    // AffineMap upMap = builder.getSymbolIdentityMap();
    // newForOp.setUpperBound({myUpperBound}, upMap);

    // // replace the original loop with the distributed version
    // forOp.erase();
  }

  // TODO: remove? -> gather all loads and stores in the loop
  void gatherLoadsAndStores(AffineForOp forOp,
                            SmallVectorImpl<Operation *> &loadAndStoreOps) {
    forOp.walk([&](Operation *op) {
      if (isa<affine::AffineReadOpInterface, affine::AffineWriteOpInterface>(
              op))
        loadAndStoreOps.push_back(op);
    });
  }

  // Builds parametric access sets for the given dimension count and symbols
  // dimCount: number of dimensions in the access set
  // symbols: symbols to be used in the access set
  // constraintBuilder: a callback function to build the constraints
  affine::FlatAffineValueConstraints buildParametricAccessSet(
      MLIRContext *context, unsigned dimCount, ArrayRef<Value> symbols,
      const std::function<void(affine::FlatAffineValueConstraints &)>
          &constraintBuilder) {

    // Create constraints for the parametric set
    affine::FlatAffineValueConstraints constraints;

    // Add dimensions for the access space (s0, s1, ...)
    constraints.appendDimVar(dimCount);

    // Add symbols (rank, problem size, etc.)
    constraints.appendSymbolVar(symbols.size());

    // Map symbol values for later use
    // track which MLIR values correspond to which mathematical variables?
    for (unsigned i = 0; i < symbols.size(); i++) {
      constraints.setValue(i, symbols[i]);
    }

    // TODO: Specify custom constraints through callback, ok?
    // - For block distribution: bounds based on rank and block size
    // - For cyclic distribution: modulo-based constraints
    // - For custom patterns: arbitrary constraints
    constraintBuilder(constraints);

    return constraints;
  }

  // TODO: ok? not tested!
  // Creates a set of constraints that define which indices (block) a specific 
  // rank should process
  void generateBlockDistribution(OpBuilder &builder, Location loc,
                                 Value rankValue, Value nRanks,
                                 Value problemSizeValue) {
    auto context = builder.getContext();

    // Set up symbols [rank, nRanks, problemSize]
    SmallVector<Value, 4> symbols = {rankValue, nRanks, problemSizeValue};

    // Build constraints for block distribution
    // TODO: this is only 1D for now! (dimCount==1) -> array based distribution
    auto constraints = buildParametricAccessSet(
        context, 1, symbols, [](affine::FlatAffineValueConstraints &cst) {
          // Rank symbol at index 0, nRanks at index 1, problemSize at index 2

          // blockSize = ceil(problemSize/nRanks)
          // start = rank * blockSize
          // end = min((rank+1) * blockSize, problemSize)

          // start <= i < end
          // rank * ceil(problemSize/nRanks) <= i < min((rank+1) *
          // ceil(problemSize/nRanks), problemSize)

          // Lower bound: i >= rank * ceil(problemSize/nRanks)
          // Used bound: i >= rank * (problemSize/nRanks) i - rank * (problemSize/nRanks) >= 0
          SmallVector<int64_t, 5> lb{
              1, 0, 0, -1,
              0}; // [i_coef, rank_coef, nRanks_coef, problemSize_coef, const]
          cst.addInequality(lb);

          // Upper bound: i < min((rank+1) * ceil(problemSize/nRanks),
          // problemSize) 
          // Used bound: i < (rank+1) * (problemSize/nRanks)
          SmallVector<int64_t, 5> ub1{-1, 1, 0, 1, 0};
          cst.addInequality(ub1);

          // Enforce i < problemSize
          SmallVector<int64_t, 5> ub2{-1, 0, 0, 1, 0};
          cst.addInequality(ub2);
        });

    // TODO: Use the constraints!!!
    // ...
  }
};

} // namespace topoly
} // namespace mlir
