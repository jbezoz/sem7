{
    %1 = alloca i32, align 4
    %2 = alloca i32, align 4
    %3 = alloca i32, align 4
    %4 = alloca i32, align 4
    store i32 0, i32* %1, align 4
    %5 = bitcast i32* %2 to i8*
    call void @llvm.lifetime.start.p0i8(i64 4, i8* %5) #3
    %6 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %2)
    %7 = bitcast i32* %3 to i8*
    call void @llvm.lifetime.start.p0i8(i64 4, i8* %7) #3
    %8 = load i32, i32* %2, align 4, !tbaa !5
    %9 = mul nsw i32 2, %8
    store i32 %9, i32* %3, align 4, !tbaa !5
    %10 = bitcast i32* %4 to i8*
    call void @llvm.lifetime.start.p0i8(i64 4, i8* %10) #3
    %11 = load i32, i32* %3, align 4, !tbaa !5
    %12 = add nsw i32 %11, 10
    store i32 %12, i32* %4, align 4, !tbaa !5
    %13 = load i32, i32* %4, align 4, !tbaa !5
    %14 = srem i32 %13, 2
    %15 = icmp ne i32 %14, 0
    br i1 %15, label %16, label %19

    16:                                               ; preds = %0
    %17 = load i32, i32* %4, align 4, !tbaa !5
    %18 = add nsw i32 %17, 1
    store i32 %18, i32* %4, align 4, !tbaa !5
    br label %24

    19:                                               ; preds = %0
    %20 = load i32, i32* %4, align 4, !tbaa !5
    %21 = sub nsw i32 %20, 10
    store i32 %21, i32* %4, align 4, !tbaa !5
    %22 = load i32, i32* %4, align 4, !tbaa !5
    %23 = sdiv i32 %22, 2
    store i32 %23, i32* %4, align 4, !tbaa !5
    br label %24

    24:                                               ; preds = %19, %16
    %25 = load i32, i32* %4, align 4, !tbaa !5
    %26 = bitcast i32* %4 to i8*
    call void @llvm.lifetime.end.p0i8(i64 4, i8* %26) #3
    %27 = bitcast i32* %3 to i8*
    call void @llvm.lifetime.end.p0i8(i64 4, i8* %27) #3
    %28 = bitcast i32* %2 to i8*
    call void @llvm.lifetime.end.p0i8(i64 4, i8* %28) #3
    ret i32 %25
}
1. Annotation2MetadataPass
2. ForceFunctionAttrsPass
3. InferFunctionAttrsPass
4. LowerExpectIntrinsicPass
5. SimplifyCFGPass



{
  %1 = alloca i32, align 4
  %2 = bitcast i32* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3
  %3 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %1)
  %4 = load i32, i32* %1, align 4, !tbaa !5
  %5 = mul nsw i32 2, %4 // %5 = %4 * 2
  %6 = add nsw i32 %5, 10 // %6 = %5 + 10
  %7 = srem i32 %6, 2
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %11

    9:                                                ; preds = %0
    %10 = add nsw i32 %6, 1
    br label %14

    11:                                               ; preds = %0
    %12 = sub nsw i32 %6, 10 // %12 = 6 - %10
    %13 = sdiv i32 %12, 2 // %13 = %12 / 2
    br label %14

    14:                                               ; preds = %11, %9
    %15 = phi i32 [ %10, %9 ], [ %13, %11 ]
    %16 = bitcast i32* %1 to i8*
    call void @llvm.lifetime.end.p0i8(i64 4, i8* %16) #3
    ret i32 %15
}
6. SROAPass (Scalar Replacement of Aggregates) : like phi function is introduced and alloc is reduced to single statement and load operation reduced



{
    %1 = alloca i32, align 4
    %2 = bitcast i32* %1 to i8*
    call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3
    %3 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %1)
    %4 = load i32, i32* %1, align 4, !tbaa !5 
    %5 = mul nsw i32 2, %4 // %5 = %4 * 2
    %6 = add nsw i32 %5, 10 // %6 = %5 + 10
    %7 = srem i32 %6, 2
    %8 = icmp ne i32 %7, 0
    br i1 %8, label %9, label %11

    9:                                                ; preds = %0
    %10 = add nsw i32 %6, 1
    br label %12

    11:                                               ; preds = %0
    br label %12

    12:                                               ; preds = %11, %9
    %13 = phi i32 [ %10, %9 ], [ %4, %11 ]
    call void @llvm.lifetime.end.p0i8(i64 4, i8* %2) #3
    ret i32 %13
}
7. EarlyCSEPass : (Common Subexpression Elimination) : 
    The EarlyCSE pass recognizes that the value %6 is the result of the computation %5 = mul nsw i32 2, %4 followed by %6 = add nsw i32 %5, 10.
    It replaces the redundant computation %5 = mul nsw i32 2, %4 in block %11 with the previously computed value %4.
    As a result, the computation %5 = mul nsw i32 2, %4 and %6 = add nsw i32 %5, 10 are computed only once before the conditional branch in block %9.
    This eliminates redundancy in the original code and can lead to more efficient code, especially if %6 is a complex computation that only needs to be done once.
8. CoroEarlyPass
9. OpenMPOptPass 
10. IPSCCPPass
11. CalledValuePropagationPass
12. GlobalOptPass
13. PromotePass
14. DeadArgumentEliminationPass

{
    %1 = alloca i32, align 4
    %2 = bitcast i32* %1 to i8*
    call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %2) #3
    %3 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef nonnull %1)
    br i1 false, label %4, label %5

    4:                                                ; preds = %0
    br label %7

    5:                                                ; preds = %0
    %6 = load i32, i32* %1, align 4, !tbaa !5
    br label %7

    7:                                                ; preds = %5, %4
    %8 = phi i32 [ undef, %4 ], [ %6, %5 ]
    call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %2) #3
    ret i32 %8
}
15. InstCombinePass :involves Constant Folding, Algebraic Identities, Strength Reduction,
Constant Propagation and Folding, Instruction Simplification

{
  %1 = alloca i32, align 4
  %2 = bitcast i32* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %2) #3
  %3 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef nonnull %1)
  %4 = load i32, i32* %1, align 4, !tbaa !5
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %2) #3
  ret i32 %4
}
16. SimplifyCFGPass :

17. RequireAnalysisPass<llvm::GlobalsAA, llvm::Module>
18. InvalidateAnalysisPass<llvm::AAManager>
19. RequireAnalysisPass<llvm::ProfileSummaryAnalysis, llvm::Module>
20. InlinerPass
21. PostOrderFunctionAttrsPass
22. SROAPass
23. EarlyCSEPass
24. SimplifyCFGPass
25. InstCombinePass
.
.
.
.
.
.
81. PrintModulePass


