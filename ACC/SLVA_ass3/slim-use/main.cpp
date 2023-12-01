#include "llvm/IRReader/IRReader.h" // For parseIRFile

#include "slim/IR.h"

static llvm::LLVMContext context;
int main(int argc, char *argv[])
{
    if (argc < 2 || argc > 2)
    {
        llvm::errs() << "We expect exactly one argument - the name of the LLVM IR file!\n";
        exit(1);
    }

    llvm::SMDiagnostic smDiagnostic;

    std::unique_ptr<llvm::Module> module = parseIRFile(argv[1], smDiagnostic, context);

    slim::IR *transformIR = new slim::IR(module);

    transformIR->dumpIR();

    return 0;
}
