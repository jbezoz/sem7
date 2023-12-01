cd testcases
clang-14 -fno-discard-value-names -emit-llvm -O0 -Xclang -disable-O0-optnone -g -S "test.c" -o "test.ll"
opt-14 -instnamer -mem2reg -mergereturn -aa-pipeline='basic-aa' -S "test.ll" > "test.slim.ll"
cd ../
./run.sh
