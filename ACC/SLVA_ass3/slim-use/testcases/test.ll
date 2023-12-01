; ModuleID = 'test.c'
source_filename = "test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [12 x i8] c"%d %d %d %d\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !10 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %b, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %c, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32* %d, metadata !21, metadata !DIExpression()), !dbg !22
  %call = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0), i32* noundef %a, i32* noundef %b, i32* noundef %c, i32* noundef %d), !dbg !23
  %0 = load i32, i32* %a, align 4, !dbg !24
  %add = add nsw i32 1, %0, !dbg !25
  store i32 %add, i32* %b, align 4, !dbg !26
  %1 = load i32, i32* %a, align 4, !dbg !27
  %add1 = add nsw i32 2, %1, !dbg !28
  store i32 %add1, i32* %c, align 4, !dbg !29
  %2 = load i32, i32* %a, align 4, !dbg !30
  %add2 = add nsw i32 3, %2, !dbg !31
  store i32 %add2, i32* %d, align 4, !dbg !32
  %3 = load i32, i32* %b, align 4, !dbg !33
  %4 = load i32, i32* %d, align 4, !dbg !35
  %cmp = icmp slt i32 %3, %4, !dbg !36
  br i1 %cmp, label %if.then, label %if.else, !dbg !37

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %b, align 4, !dbg !38
  %add3 = add nsw i32 %5, 1, !dbg !40
  store i32 %add3, i32* %a, align 4, !dbg !41
  br label %if.end, !dbg !42

if.else:                                          ; preds = %entry
  %6 = load i32, i32* %d, align 4, !dbg !43
  %add4 = add nsw i32 %6, 5, !dbg !45
  store i32 %add4, i32* %a, align 4, !dbg !46
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.cond, !dbg !47

while.cond:                                       ; preds = %while.body, %if.end
  %7 = load i32, i32* %b, align 4, !dbg !48
  %cmp5 = icmp sgt i32 %7, 5, !dbg !49
  br i1 %cmp5, label %while.body, label %while.end, !dbg !47

while.body:                                       ; preds = %while.cond
  %8 = load i32, i32* %b, align 4, !dbg !50
  %sub = sub nsw i32 %8, 1, !dbg !52
  store i32 %sub, i32* %b, align 4, !dbg !53
  br label %while.cond, !dbg !47, !llvm.loop !54

while.end:                                        ; preds = %while.cond
  %9 = load i32, i32* %a, align 4, !dbg !57
  %10 = load i32, i32* %c, align 4, !dbg !58
  %add6 = add nsw i32 %9, %10, !dbg !59
  ret i32 %add6, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @__isoc99_scanf(i8* noundef, ...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 14.0.0-1ubuntu1.1", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test.c", directory: "/home/jarvis/final/slim-use/testcases", checksumkind: CSK_MD5, checksum: "c681f9943c521d1aba24b2de682f1cf6")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!10 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 3, type: !11, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "a", scope: !10, file: !1, line: 4, type: !13)
!16 = !DILocation(line: 4, column: 6, scope: !10)
!17 = !DILocalVariable(name: "b", scope: !10, file: !1, line: 4, type: !13)
!18 = !DILocation(line: 4, column: 8, scope: !10)
!19 = !DILocalVariable(name: "c", scope: !10, file: !1, line: 4, type: !13)
!20 = !DILocation(line: 4, column: 10, scope: !10)
!21 = !DILocalVariable(name: "d", scope: !10, file: !1, line: 4, type: !13)
!22 = !DILocation(line: 4, column: 12, scope: !10)
!23 = !DILocation(line: 5, column: 2, scope: !10)
!24 = !DILocation(line: 6, column: 10, scope: !10)
!25 = !DILocation(line: 6, column: 8, scope: !10)
!26 = !DILocation(line: 6, column: 4, scope: !10)
!27 = !DILocation(line: 7, column: 10, scope: !10)
!28 = !DILocation(line: 7, column: 8, scope: !10)
!29 = !DILocation(line: 7, column: 4, scope: !10)
!30 = !DILocation(line: 8, column: 10, scope: !10)
!31 = !DILocation(line: 8, column: 8, scope: !10)
!32 = !DILocation(line: 8, column: 4, scope: !10)
!33 = !DILocation(line: 9, column: 5, scope: !34)
!34 = distinct !DILexicalBlock(scope: !10, file: !1, line: 9, column: 5)
!35 = !DILocation(line: 9, column: 9, scope: !34)
!36 = !DILocation(line: 9, column: 7, scope: !34)
!37 = !DILocation(line: 9, column: 5, scope: !10)
!38 = !DILocation(line: 10, column: 7, scope: !39)
!39 = distinct !DILexicalBlock(scope: !34, file: !1, line: 9, column: 12)
!40 = !DILocation(line: 10, column: 9, scope: !39)
!41 = !DILocation(line: 10, column: 5, scope: !39)
!42 = !DILocation(line: 11, column: 2, scope: !39)
!43 = !DILocation(line: 12, column: 7, scope: !44)
!44 = distinct !DILexicalBlock(scope: !34, file: !1, line: 11, column: 9)
!45 = !DILocation(line: 12, column: 9, scope: !44)
!46 = !DILocation(line: 12, column: 5, scope: !44)
!47 = !DILocation(line: 14, column: 2, scope: !10)
!48 = !DILocation(line: 14, column: 8, scope: !10)
!49 = !DILocation(line: 14, column: 10, scope: !10)
!50 = !DILocation(line: 15, column: 7, scope: !51)
!51 = distinct !DILexicalBlock(scope: !10, file: !1, line: 14, column: 15)
!52 = !DILocation(line: 15, column: 9, scope: !51)
!53 = !DILocation(line: 15, column: 5, scope: !51)
!54 = distinct !{!54, !47, !55, !56}
!55 = !DILocation(line: 16, column: 2, scope: !10)
!56 = !{!"llvm.loop.mustprogress"}
!57 = !DILocation(line: 17, column: 9, scope: !10)
!58 = !DILocation(line: 17, column: 13, scope: !10)
!59 = !DILocation(line: 17, column: 11, scope: !10)
!60 = !DILocation(line: 17, column: 2, scope: !10)
