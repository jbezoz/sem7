-- The C compiler identification is GNU 11.4.0
-- The CXX compiler identification is GNU 11.4.0
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /usr/bin/cc - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /usr/bin/c++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Performing Test HAVE_FFI_CALL
-- Performing Test HAVE_FFI_CALL - Success
-- Found FFI: /usr/lib/x86_64-linux-gnu/libffi.so  
-- Performing Test Terminfo_LINKABLE
-- Performing Test Terminfo_LINKABLE - Success
-- Found Terminfo: /usr/lib/x86_64-linux-gnu/libtinfo.so  
-- Found ZLIB: /usr/lib/x86_64-linux-gnu/libz.so (found version "1.2.11") 
-- Found LibXml2: /usr/lib/x86_64-linux-gnu/libxml2.so (found version "2.9.13") 
-- Configuring done
-- Generating done
-- Build files have been written to: /home/jarvis/ACC/slim-use/build
[ 50%] Building CXX object CMakeFiles/cs-ssa.dir/main.cpp.o
[100%] Linking CXX executable cs-ssa
[100%] Built target cs-ssa
Total number of functions: 1
Total number of basic blocks: 6
Total number of instructions: 19
Total number of call instructions: 0
Total number of direct-call instructions: 0
Total number of indirect-call instructions: 0
[test.c] Function: main
-------------------------------------
Basic block 0: entry (Predecessors: [])
 [0][7] cmp_main = 6 > 5
 [1][7] branch (cmp_main) if.then_main, if.end_main


Basic block 1: if.then_main (Predecessors: [entry])
 [2][8] add_main = 5 + 6
 [3][9] sub_main = 6 - add_main
 [4][10] branch if.end_main


Basic block 2: if.end_main (Predecessors: [if.then_main, entry])
 [5]b.0_main = phi(add_main, 5)
 [6]a.0_main = phi(sub_main, 6)
 [7][11] branch while.cond_main


Basic block 3: while.cond_main (Predecessors: [while.body_main, if.end_main])
 [8]b.1_main = phi(b.0_main, add3_main)
 [9]a.1_main = phi(a.0_main, add2_main)
 [10]c.0_main = phi(0, add5_main)
 [11][11] cmp1_main = a.1_main < b.1_main
 [12][11] branch (cmp1_main) while.body_main, while.end_main


Basic block 4: while.body_main (Predecessors: [while.cond_main])
 [13][12] add2_main = a.1_main + 1
 [14][13] add3_main = b.1_main + 1
 [15][14] add4_main = add2_main + add3_main
 [16][14] add5_main = add4_main + c.0_main
 [17][11] branch while.cond_main


Basic block 5: while.end_main (Predecessors: [while.cond_main])
 [18][16] return c.0_main



///////////////////// Reverse Iteration //////////////////////////////
[test.c] Function: main
-------------------------------------

Basic block 4: while.body_main (Predecessors: [while.cond_main]-------Successors: [while.cond_main------3])

BB_curr_Out[4] : 
 [13]
LHS is LIVE
String_LHS : add2_main : String_RHS : a.1_main ,
[12] add2_main = a.1_main + 1
 [14]
LHS is LIVE
String_LHS : add3_main : String_RHS : b.1_main ,
[13] add3_main = b.1_main + 1
 [15]
LHS is LIVE
String_LHS : add4_main : String_RHS : 
[14] add4_main = add2_main + add3_main
 [16]
LHS is LIVE
String_LHS : add5_main : String_RHS : c.0_main ,
[14] add5_main = add4_main + c.0_main
 [17][11] branch while.cond_main

BB_curr_In[4] : a.1_main, b.1_main, c.0_main, 

Basic block 5: while.end_main (Predecessors: [while.cond_main]-------Successors: [])

BB_curr_Out[5] : 
 [18]
String_LHS : empty    : String_RHS : c.0_main
[16] return c.0_main

BB_curr_In[5] : c.0_main, 

Basic block 3: while.cond_main (Predecessors: [while.body_main, if.end_main]-------Successors: [while.body_main------4 , while.end_main------5])

BB_curr_Out[3] : a.1_main, b.1_main, c.0_main, 
 [8]b.1_main = phi(b.0_main, add3_main)
 [9]a.1_main = phi(a.0_main, add2_main)
 [10]c.0_main = phi(0, add5_main)
 [11]
LHS is LIVE
String_LHS : cmp1_main : String_RHS : a.1_main ,b.1_main ,
[11] cmp1_main = a.1_main < b.1_main
 [12][11] branch (cmp1_main) while.body_main, while.end_main

BB_curr_In[3] : a.1_main, b.1_main, c.0_main, 

Basic block 2: if.end_main (Predecessors: [if.then_main, entry]-------Successors: [while.cond_main------3])

BB_curr_Out[2] : a.1_main, b.1_main, c.0_main, 
 [5]b.0_main = phi(add_main, 5)
 [6]a.0_main = phi(sub_main, 6)
 [7][11] branch while.cond_main

BB_curr_In[2] : a.1_main, b.1_main, c.0_main, 

Basic block 1: if.then_main (Predecessors: [entry]-------Successors: [if.end_main------2])

BB_curr_Out[1] : a.1_main, b.1_main, c.0_main, 
 [2]
LHS is LIVE
String_LHS : add_main : String_RHS : 
[8] add_main = 5 + 6
 [3]
LHS is LIVE
String_LHS : sub_main : String_RHS : 
[9] sub_main = 6 - add_main
 [4][10] branch if.end_main

BB_curr_In[1] : a.1_main, b.1_main, c.0_main, 

Basic block 0: entry (Predecessors: []-------Successors: [if.then_main------1 , if.end_main------2])

BB_curr_Out[0] : a.1_main, b.1_main, c.0_main, 
 [0]
LHS is LIVE
String_LHS : cmp_main : String_RHS : 
[7] cmp_main = 6 > 5
 [1][7] branch (cmp_main) if.then_main, if.end_main

BB_curr_In[0] : a.1_main, b.1_main, c.0_main, 

ITERATION : 1
[test.c] Function: main
-------------------------------------

Basic block 4: while.body_main (Predecessors: [while.cond_main]-------Successors: [while.cond_main------3])

BB_curr_Out[4] : a.1_main, b.1_main, c.0_main, 
 [13]
LHS is LIVE
String_LHS : add2_main : String_RHS : a.1_main ,
[12] add2_main = a.1_main + 1
 [14]
LHS is LIVE
String_LHS : add3_main : String_RHS : b.1_main ,
[13] add3_main = b.1_main + 1
 [15]
LHS is LIVE
String_LHS : add4_main : String_RHS : 
[14] add4_main = add2_main + add3_main
 [16]
LHS is LIVE
String_LHS : add5_main : String_RHS : c.0_main ,
[14] add5_main = add4_main + c.0_main
 [17][11] branch while.cond_main

BB_curr_In[4] : a.1_main, b.1_main, c.0_main, 

Basic block 5: while.end_main (Predecessors: [while.cond_main]-------Successors: [])

BB_curr_Out[5] : c.0_main, 
 [18]
String_LHS : empty    : String_RHS : c.0_main
[16] return c.0_main

BB_curr_In[5] : c.0_main, 

Basic block 3: while.cond_main (Predecessors: [while.body_main, if.end_main]-------Successors: [while.body_main------4 , while.end_main------5])

BB_curr_Out[3] : a.1_main, b.1_main, c.0_main, 
 [8]b.1_main = phi(b.0_main, add3_main)
 [9]a.1_main = phi(a.0_main, add2_main)
 [10]c.0_main = phi(0, add5_main)
 [11]
LHS is LIVE
String_LHS : cmp1_main : String_RHS : a.1_main ,b.1_main ,
[11] cmp1_main = a.1_main < b.1_main
 [12][11] branch (cmp1_main) while.body_main, while.end_main

BB_curr_In[3] : a.1_main, b.1_main, c.0_main, 

Basic block 2: if.end_main (Predecessors: [if.then_main, entry]-------Successors: [while.cond_main------3])

BB_curr_Out[2] : a.1_main, b.1_main, c.0_main, 
 [5]b.0_main = phi(add_main, 5)
 [6]a.0_main = phi(sub_main, 6)
 [7][11] branch while.cond_main

BB_curr_In[2] : a.1_main, b.1_main, c.0_main, 

Basic block 1: if.then_main (Predecessors: [entry]-------Successors: [if.end_main------2])

BB_curr_Out[1] : a.1_main, b.1_main, c.0_main, 
 [2]
LHS is LIVE
String_LHS : add_main : String_RHS : 
[8] add_main = 5 + 6
 [3]
LHS is LIVE
String_LHS : sub_main : String_RHS : 
[9] sub_main = 6 - add_main
 [4][10] branch if.end_main

BB_curr_In[1] : a.1_main, b.1_main, c.0_main, 

Basic block 0: entry (Predecessors: []-------Successors: [if.then_main------1 , if.end_main------2])

BB_curr_Out[0] : a.1_main, b.1_main, c.0_main, 
 [0]
LHS is LIVE
String_LHS : cmp_main : String_RHS : 
[7] cmp_main = 6 > 5
 [1][7] branch (cmp_main) if.then_main, if.end_main

BB_curr_In[0] : a.1_main, b.1_main, c.0_main, 

ITERATION : 2
[test.c] Function: main
-------------------------------------

Basic block 4: while.body_main (Predecessors: [while.cond_main]-------Successors: [while.cond_main------3])

BB_curr_Out[4] : a.1_main, b.1_main, c.0_main, 
 [13]
LHS is LIVE
String_LHS : add2_main : String_RHS : a.1_main ,
[12] add2_main = a.1_main + 1
 [14]
LHS is LIVE
String_LHS : add3_main : String_RHS : b.1_main ,
[13] add3_main = b.1_main + 1
 [15]
LHS is LIVE
String_LHS : add4_main : String_RHS : 
[14] add4_main = add2_main + add3_main
 [16]
LHS is LIVE
String_LHS : add5_main : String_RHS : c.0_main ,
[14] add5_main = add4_main + c.0_main
 [17][11] branch while.cond_main

BB_curr_In[4] : a.1_main, b.1_main, c.0_main, 

Basic block 5: while.end_main (Predecessors: [while.cond_main]-------Successors: [])

BB_curr_Out[5] : c.0_main, 
 [18]
String_LHS : empty    : String_RHS : c.0_main
[16] return c.0_main

BB_curr_In[5] : c.0_main, 

Basic block 3: while.cond_main (Predecessors: [while.body_main, if.end_main]-------Successors: [while.body_main------4 , while.end_main------5])

BB_curr_Out[3] : a.1_main, b.1_main, c.0_main, 
 [8]b.1_main = phi(b.0_main, add3_main)
 [9]a.1_main = phi(a.0_main, add2_main)
 [10]c.0_main = phi(0, add5_main)
 [11]
LHS is LIVE
String_LHS : cmp1_main : String_RHS : a.1_main ,b.1_main ,
[11] cmp1_main = a.1_main < b.1_main
 [12][11] branch (cmp1_main) while.body_main, while.end_main

BB_curr_In[3] : a.1_main, b.1_main, c.0_main, 

Basic block 2: if.end_main (Predecessors: [if.then_main, entry]-------Successors: [while.cond_main------3])

BB_curr_Out[2] : a.1_main, b.1_main, c.0_main, 
 [5]b.0_main = phi(add_main, 5)
 [6]a.0_main = phi(sub_main, 6)
 [7][11] branch while.cond_main

BB_curr_In[2] : a.1_main, b.1_main, c.0_main, 

Basic block 1: if.then_main (Predecessors: [entry]-------Successors: [if.end_main------2])

BB_curr_Out[1] : a.1_main, b.1_main, c.0_main, 
 [2]
LHS is LIVE
String_LHS : add_main : String_RHS : 
[8] add_main = 5 + 6
 [3]
LHS is LIVE
String_LHS : sub_main : String_RHS : 
[9] sub_main = 6 - add_main
 [4][10] branch if.end_main

BB_curr_In[1] : a.1_main, b.1_main, c.0_main, 

Basic block 0: entry (Predecessors: []-------Successors: [if.then_main------1 , if.end_main------2])

BB_curr_Out[0] : a.1_main, b.1_main, c.0_main, 
 [0]
LHS is LIVE
String_LHS : cmp_main : String_RHS : 
[7] cmp_main = 6 > 5
 [1][7] branch (cmp_main) if.then_main, if.end_main

BB_curr_In[0] : a.1_main, b.1_main, c.0_main, 

ITERATION : 3
