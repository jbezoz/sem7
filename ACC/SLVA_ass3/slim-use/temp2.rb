Total number of functions: 2
Total number of basic blocks: 8
Total number of instructions: 20
Total number of call instructions: 2
Total number of direct-call instructions: 2
Total number of indirect-call instructions: 0
[test.c] Function: p
-------------------------------------

Basic block 6: if.end4_p (Predecessors: [if.end_p, if.then_p]-------Successors: [])
BB_OUT : 
 [13][12] return result.1_p
 [12]result.1_p = phi(mul_p, result.0_p)
BB_IN : mul_p  result.0_p  
===========================================================

Basic block 1: if.then_p (Predecessors: [entry]-------Successors: [if.end4_p------6])
BB_OUT : mul_p  result.0_p  
 [3][6] branch if.end4_p
 [2][5] mul_p = x_p * 2
BB_IN : result.0_p  x_p  
===========================================================

Basic block 5: if.end_p (Predecessors: [if.else3_p, if.then2_p]-------Successors: [if.end4_p------6])
BB_OUT : mul_p  result.0_p  
 [11]branch if.end4_p
 [10]result.0_p = phi(div_p, add_p)
BB_IN : add_p  div_p  mul_p  
===========================================================

Basic block 3: if.then2_p (Predecessors: [if.else_p]-------Successors: [if.end_p------5])
BB_OUT : add_p  div_p  mul_p  
 [7][8] branch if.end_p
 [6][7] div_p = x_p / 3
BB_IN : add_p  mul_p  x_p  
===========================================================

Basic block 4: if.else3_p (Predecessors: [if.else_p]-------Successors: [if.end_p------5])
BB_OUT : add_p  div_p  mul_p  
 [9]branch if.end_p
 [8][9] add_p = x_p + 1
BB_IN : div_p  mul_p  x_p  
===========================================================

Basic block 2: if.else_p (Predecessors: [entry]-------Successors: [if.then2_p------3 , if.else3_p------4])
BB_OUT : add_p  div_p  mul_p  x_p  
 [5][6] branch (cmp1_p) if.then2_p, if.else3_p
 [4][6] cmp1_p = x_p == 0
BB_IN : add_p  div_p  mul_p  x_p  
===========================================================

Basic block 0: entry (Predecessors: []-------Successors: [if.then_p------1 , if.else_p------2])
BB_OUT : add_p  div_p  mul_p  result.0_p  x_p  
 [1][4] branch (cmp_p) if.then_p, if.else_p
 [0][4] cmp_p = x_p > 0
BB_IN : add_p  div_p  mul_p  result.0_p  x_p  
===========================================================
[test.c] Function: main
-------------------------------------

Basic block 7: entry (Predecessors: []-------Successors: [])
BB_OUT : 
 [19][18] return call1_main
 [18][18] call1_main = call p(i_main)
 [17][18] <x_p, 1> = <i_main, 1>
 [16][18] <i_main, 1> = <x_main, 1>
 [15][17] call = call __isoc99_scanf(.str[0][0], x_main)
 [14]ALLOCA
BB_IN : call1_main  
===========================================================

ITERATION : 1
[test.c] Function: p
-------------------------------------

Basic block 6: if.end4_p (Predecessors: [if.end_p, if.then_p]-------Successors: [])
BB_OUT : 
 [13][12] return result.1_p
 [12]result.1_p = phi(mul_p, result.0_p)
BB_IN : mul_p  result.0_p  
===========================================================

Basic block 1: if.then_p (Predecessors: [entry]-------Successors: [if.end4_p------6])
BB_OUT : mul_p  result.0_p  
 [3][6] branch if.end4_p
 [2][5] mul_p = x_p * 2
BB_IN : result.0_p  x_p  
===========================================================

Basic block 5: if.end_p (Predecessors: [if.else3_p, if.then2_p]-------Successors: [if.end4_p------6])
BB_OUT : mul_p  result.0_p  
 [11]branch if.end4_p
 [10]result.0_p = phi(div_p, add_p)
BB_IN : add_p  div_p  mul_p  
===========================================================

Basic block 3: if.then2_p (Predecessors: [if.else_p]-------Successors: [if.end_p------5])
BB_OUT : add_p  div_p  mul_p  
 [7][8] branch if.end_p
 [6][7] div_p = x_p / 3
BB_IN : add_p  mul_p  x_p  
===========================================================

Basic block 4: if.else3_p (Predecessors: [if.else_p]-------Successors: [if.end_p------5])
BB_OUT : add_p  div_p  mul_p  
 [9]branch if.end_p
 [8][9] add_p = x_p + 1
BB_IN : div_p  mul_p  x_p  
===========================================================

Basic block 2: if.else_p (Predecessors: [entry]-------Successors: [if.then2_p------3 , if.else3_p------4])
BB_OUT : add_p  div_p  mul_p  x_p  
 [5][6] branch (cmp1_p) if.then2_p, if.else3_p
 [4][6] cmp1_p = x_p == 0
BB_IN : add_p  div_p  mul_p  x_p  
===========================================================

Basic block 0: entry (Predecessors: []-------Successors: [if.then_p------1 , if.else_p------2])
BB_OUT : add_p  div_p  mul_p  result.0_p  x_p  
 [1][4] branch (cmp_p) if.then_p, if.else_p
 [0][4] cmp_p = x_p > 0
BB_IN : add_p  div_p  mul_p  result.0_p  x_p  
===========================================================
[test.c] Function: main
-------------------------------------

Basic block 7: entry (Predecessors: []-------Successors: [])
BB_OUT : 
 [19][18] return call1_main
 [18][18] call1_main = call p(i_main)
 [17][18] <x_p, 1> = <i_main, 1>
 [16][18] <i_main, 1> = <x_main, 1>
 [15][17] call = call __isoc99_scanf(.str[0][0], x_main)
 [14]ALLOCA
BB_IN : call1_main  
===========================================================

ITERATION : 2
Total number of functions: 2
Total number of basic blocks: 8
Total number of instructions: 20
Total number of call instructions: 2
Total number of direct-call instructions: 2
Total number of indirect-call instructions: 0
[test.c] Function: p
-------------------------------------

Basic block 6: if.end4_p (Predecessors: [if.end_p, if.then_p]-------Successors: [])
BB_OUT : 
 [13][12] return result.1_p
 [12]result.1_p = phi(mul_p, result.0_p)
BB_IN : mul_p  result.0_p  
===========================================================

Basic block 1: if.then_p (Predecessors: [entry]-------Successors: [if.end4_p------6])
BB_OUT : mul_p  result.0_p  
 [3][6] branch if.end4_p
 [2][5] mul_p = x_p * 2
BB_IN : result.0_p  x_p  
===========================================================

Basic block 5: if.end_p (Predecessors: [if.else3_p, if.then2_p]-------Successors: [if.end4_p------6])
BB_OUT : mul_p  result.0_p  
 [11]branch if.end4_p
 [10]result.0_p = phi(div_p, add_p)
BB_IN : add_p  div_p  mul_p  
===========================================================

Basic block 3: if.then2_p (Predecessors: [if.else_p]-------Successors: [if.end_p------5])
BB_OUT : add_p  div_p  mul_p  
 [7][8] branch if.end_p
 [6][7] div_p = x_p / 3
BB_IN : add_p  mul_p  x_p  
===========================================================

Basic block 4: if.else3_p (Predecessors: [if.else_p]-------Successors: [if.end_p------5])
BB_OUT : add_p  div_p  mul_p  
 [9]branch if.end_p
 [8][9] add_p = x_p + 1
BB_IN : div_p  mul_p  x_p  
===========================================================

Basic block 2: if.else_p (Predecessors: [entry]-------Successors: [if.then2_p------3 , if.else3_p------4])
BB_OUT : add_p  div_p  mul_p  x_p  
 [5][6] branch (cmp1_p) if.then2_p, if.else3_p
 [4][6] cmp1_p = x_p == 0
BB_IN : add_p  div_p  mul_p  x_p  
===========================================================

Basic block 0: entry (Predecessors: []-------Successors: [if.then_p------1 , if.else_p------2])
BB_OUT : add_p  div_p  mul_p  result.0_p  x_p  
 [1][4] branch (cmp_p) if.then_p, if.else_p
 [0][4] cmp_p = x_p > 0
BB_IN : add_p  div_p  mul_p  result.0_p  x_p  
===========================================================
[test.c] Function: main
-------------------------------------

Basic block 7: entry (Predecessors: []-------Successors: [])
BB_OUT : 
 [19][18] return call1_main
 [18][18] call1_main = call p(i_main)
 [17][18] <x_p, 1> = <i_main, 1>
 [16][18] <i_main, 1> = <x_main, 1>
 [15][17] call = call __isoc99_scanf(.str[0][0], x_main)
 [14]ALLOCA
BB_IN : call1_main  
===========================================================

ITERATION : 1
[test.c] Function: p
-------------------------------------

Basic block 6: if.end4_p (Predecessors: [if.end_p, if.then_p]-------Successors: [])
BB_OUT : 
 [13][12] return result.1_p
 [12]result.1_p = phi(mul_p, result.0_p)
BB_IN : mul_p  result.0_p  
===========================================================

Basic block 1: if.then_p (Predecessors: [entry]-------Successors: [if.end4_p------6])
BB_OUT : mul_p  result.0_p  
 [3][6] branch if.end4_p
 [2][5] mul_p = x_p * 2
BB_IN : result.0_p  x_p  
===========================================================

Basic block 5: if.end_p (Predecessors: [if.else3_p, if.then2_p]-------Successors: [if.end4_p------6])
BB_OUT : mul_p  result.0_p  
 [11]branch if.end4_p
 [10]result.0_p = phi(div_p, add_p)
BB_IN : add_p  div_p  mul_p  
===========================================================

Basic block 3: if.then2_p (Predecessors: [if.else_p]-------Successors: [if.end_p------5])
BB_OUT : add_p  div_p  mul_p  
 [7][8] branch if.end_p
 [6][7] div_p = x_p / 3
BB_IN : add_p  mul_p  x_p  
===========================================================

Basic block 4: if.else3_p (Predecessors: [if.else_p]-------Successors: [if.end_p------5])
BB_OUT : add_p  div_p  mul_p  
 [9]branch if.end_p
 [8][9] add_p = x_p + 1
BB_IN : div_p  mul_p  x_p  
===========================================================

Basic block 2: if.else_p (Predecessors: [entry]-------Successors: [if.then2_p------3 , if.else3_p---Key: 0
Set 1: add_p div_p mul_p result.0_p x_p 
Set 2: 
------------------------
Key: 1
Set 1: result.0_p x_p 
Set 2: 
------------------------
Key: 2
Set 1: add_p div_p mul_p x_p 
Set 2: 
------------------------
Key: 3
Set 1: add_p mul_p x_p 
Set 2: 
------------------------
Key: 4
Set 1: div_p mul_p x_p 
Set 2: 
------------------------
Key: 5
Set 1: add_p div_p mul_p 
Set 2: 
------------------------
Key: 6
Set 1: mul_p result.0_p 
Set 2: 
------------------------
Key: 7
Set 1: call1_main 
Set 2: 
------------------------
Key: 0
Set 1: add_p div_p mul_p result.0_p x_p 
Set 2: 
------------------------
Key: 1
Set 1: result.0_p x_p 
Set 2: 
------------------------
Key: 2
Set 1: add_p div_p mul_p x_p 
Set 2: 
------------------------
Key: 3
Set 1: add_p mul_p x_p 
Set 2: 
------------------------
Key: 4
Set 1: div_p mul_p x_p 
Set 2: 
------------------------
Key: 5
Set 1: add_p div_p mul_p 
Set 2: 
------------------------
Key: 6
Set 1: mul_p result.0_p 
Set 2: 
------------------------
Key: 7
Set 1: call1_main 
Set 2: 
------------------------
---4])
BB_OUT : add_p  div_p  mul_p  x_p  
 [5][6] branch (cmp1_p) if.then2_p, if.else3_p
 [4][6] cmp1_p = x_p == 0
BB_IN : add_p  div_p  mul_p  x_p  
===========================================================

Basic block 0: entry (Predecessors: []-------Successors: [if.then_p------1 , if.else_p------2])
BB_OUT : add_p  div_p  mul_p  result.0_p  x_p  
 [1][4] branch (cmp_p) if.then_p, if.else_p
 [0][4] cmp_p = x_p > 0
BB_IN : add_p  div_p  mul_p  result.0_p  x_p  
===========================================================
[test.c] Function: main
-------------------------------------

Basic block 7: entry (Predecessors: []-------Successors: [])
BB_OUT : 
 [19][18] return call1_main
 [18][18] call1_main = call p(i_main)
 [17][18] <x_p, 1> = <i_main, 1>
 [16][18] <i_main, 1> = <x_main, 1>
 [15][17] call = call __isoc99_scanf(.str[0][0], x_main)
 [14]ALLOCA
BB_IN : call1_main  
===========================================================

ITERATION : 2
Total number of functions: 2
Total number of basic blocks: 8
Total number of instructions: 20
Total number of call instructions: 2
Total number of direct-call instructions: 2
Total number of indirect-call instructions: 0
[test.c] Function: p
-------------------------------------

Basic block 6: if.end4_p (Predecessors: [if.end_p, if.then_p]-------Successors: [])
BB_OUT : 
 [13][12] return result.1_p
 [12]result.1_p = phi(mul_p, result.0_p)
BB_IN : mul_p  result.0_p  
===========================================================

Basic block 1: if.then_p (Predecessors: [entry]-------Successors: [if.end4_p------6])
BB_OUT : mul_p  result.0_p  
 [3][6] branch if.end4_p
 [2][5] mul_p = x_p * 2
BB_IN : result.0_p  x_p  
===========================================================

Basic block 5: if.end_p (Predecessors: [if.else3_p, if.then2_p]-------Successors: [if.end4_p------6])
BB_OUT : mul_p  result.0_p  
 [11]branch if.end4_p
 [10]result.0_p = phi(div_p, add_p)
BB_IN : add_p  div_p  mul_p  
===========================================================

Basic block 3: if.then2_p (Predecessors: [if.else_p]-------Successors: [if.end_p------5])
BB_OUT : add_p  div_p  mul_p  
 [7][8] branch if.end_p
 [6][7] div_p = x_p / 3
BB_IN : add_p  mul_p  x_p  
===========================================================

Basic block 4: if.else3_p (Predecessors: [if.else_p]-------Successors: [if.end_p------5])
BB_OUT : add_p  div_p  mul_p  
 [9]branch if.end_p
 [8][9] add_p = x_p + 1
BB_IN : div_p  mul_p  x_p  
===========================================================

Basic block 2: if.else_p (Predecessors: [entry]-------Successors: [if.then2_p------3 , if.else3_p------4])
BB_OUT : add_p  div_p  mul_p  x_p  
 [5][6] branch (cmp1_p) if.then2_p, if.else3_p
 [4][6] cmp1_p = x_p == 0
BB_IN : add_p  div_p  mul_p  x_p  
===========================================================

Basic block 0: entry (Predecessors: []-------Successors: [if.then_p------1 , if.else_p------2])
BB_OUT : add_p  div_p  mul_p  result.0_p  x_p  
 [1][4] branch (cmp_p) if.then_p, if.else_p
 [0][4] cmp_p = x_p > 0
BB_IN : add_p  div_p  mul_p  result.0_p  x_p  
===========================================================
[test.c] Function: main
-------------------------------------

Basic block 7: entry (Predecessors: []-------Successors: [])
BB_OUT : 
 [19][18] return call1_main
 [18][18] call1_main = call p(i_main)
 [17][18] <x_p, 1> = <i_main, 1>
 [16][18] <i_main, 1> = <x_main, 1>
 [15][17] call = call __isoc99_scanf(.str[0][0], x_main)
 [14]ALLOCA
BB_IN : call1_main  
===========================================================

ITERATION : 1
[test.c] Function: p
-------------------------------------

Basic block 6: if.end4_p (Predecessors: [if.end_p, if.then_p]-------Successors: [])
BB_OUT : 
 [13][12] return result.1_p
 [12]result.1_p = phi(mul_p, result.0_p)
BB_IN : mul_p  result.0_p  
===========================================================

Basic block 1: if.then_p (Predecessors: [entry]-------Successors: [if.end4_p------6])
BB_OUT : mul_p  result.0_p  
 [3][6] branch if.end4_p
 [2][5] mul_p = x_p * 2
BB_IN : result.0_p  x_p  
===========================================================

Basic block 5: if.end_p (Predecessors: [if.else3_p, if.then2_p]-------Successors: [if.end4_p------6])
BB_OUT : mul_p  result.0_p  
 [11]branch if.end4_p
 [10]result.0_p = phi(div_p, add_p)
BB_IN : add_p  div_p  mul_p  
===========================================================

Basic block 3: if.then2_p (Predecessors: [if.else_p]-------Successors: [if.end_p------5])
BB_OUT : add_p  div_p  mul_p  
 [7][8] branch if.end_p
 [6][7] div_p = x_p / 3
BB_IN : add_p  mul_p  x_p  
===========================================================

Basic block 4: if.else3_p (Predecessors: [if.else_p]-------Successors: [if.end_p------5])
BB_OUT : add_p  div_p  mul_p  
 [9]branch if.end_p
 [8][9] add_p = x_p + 1
BB_IN : div_p  mul_p  x_p  
===========================================================

Basic block 2: if.else_p (Predecessors: [entry]-------Successors: [if.then2_p------3 , if.else3_p---Key: 0
Set 1: add_p div_p mul_p result.0_p x_p 
Set 2: 
------------------------
Key: 1
Set 1: result.0_p x_p 
Set 2: 
------------------------
Key: 2
Set 1: add_p div_p mul_p x_p 
Set 2: 
------------------------
Key: 3
Set 1: add_p mul_p x_p 
Set 2: 
------------------------
Key: 4
Set 1: div_p mul_p x_p 
Set 2: 
------------------------
Key: 5
Set 1: add_p div_p mul_p 
Set 2: 
------------------------
Key: 6
Set 1: mul_p result.0_p 
Set 2: 
------------------------
Key: 0
Set 1: add_p div_p mul_p result.0_p x_p 
Set 2: 
------------------------
Key: 1
Set 1: result.0_p x_p 
Set 2: 
------------------------
Key: 2
Set 1: add_p div_p mul_p x_p 
Set 2: 
------------------------
Key: 3
Set 1: add_p mul_p x_p 
Set 2: 
------------------------
Key: 4
Set 1: div_p mul_p x_p 
Set 2: 
------------------------
Key: 5
Set 1: add_p div_p mul_p 
Set 2: 
------------------------
Key: 6
Set 1: mul_p result.0_p 
Set 2: 
------------------------
Key: 7
Set 1: call1_main 
Set 2: 
------------------------
Key: 0
Set 1: add_p div_p mul_p result.0_p x_p 
Set 2: 
------------------------
Key: 1
Set 1: result.0_p x_p 
Set 2: 
------------------------
Key: 2
Set 1: add_p div_p mul_p x_p 
Set 2: 
------------------------
Key: 3
Set 1: add_p mul_p x_p 
Set 2: 
------------------------
Key: 4
Set 1: div_p mul_p x_p 
Set 2: 
------------------------
Key: 5
Set 1: add_p div_p mul_p 
Set 2: 
------------------------
Key: 6
Set 1: mul_p result.0_p 
Set 2: 
------------------------
Key: 7
Set 1: call1_main 
Set 2: 
------------------------
Key: 0
Set 1: add_p div_p mul_p result.0_p x_p 
Set 2: 
------------------------
Key: 1
Set 1: result.0_p x_p 
Set 2: 
------------------------
Key: 2
Set 1: add_p div_p mul_p x_p 
Set 2: 
------------------------
Key: 3
Set 1: add_p mul_p x_p 
Set 2: 
------------------------
Key: 4
Set 1: div_p mul_p x_p 
Set 2: 
------------------------
Key: 5
Set 1: add_p div_p mul_p 
Set 2: 
------------------------
Key: 6
Set 1: mul_p result.0_p 
Set 2: 
------------------------
Key: 7
Set 1: call1_main 
Set 2: 
------------------------
---4])
BB_OUT : add_p  div_p  mul_p  x_p  
 [5][6] branch (cmp1_p) if.then2_p, if.else3_p
 [4][6] cmp1_p = x_p == 0
BB_IN : add_p  div_p  mul_p  x_p  
===========================================================

Basic block 0: entry (Predecessors: []-------Successors: [if.then_p------1 , if.else_p------2])
BB_OUT : add_p  div_p  mul_p  result.0_p  x_p  
 [1][4] branch (cmp_p) if.then_p, if.else_p
 [0][4] cmp_p = x_p > 0
BB_IN : add_p  div_p  mul_p  result.0_p  x_p  
===========================================================
[test.c] Function: main
-------------------------------------

Basic block 7: entry (Predecessors: []-------Successors: [])
BB_OUT : 
 [19][18] return call1_main
 [18][18] call1_main = call p(i_main)
 [17][18] <x_p, 1> = <i_main, 1>
 [16][18] <i_main, 1> = <x_main, 1>
 [15][17] call = call __isoc99_scanf(.str[0][0], x_main)
 [14]ALLOCA
BB_IN : call1_main  
===========================================================

ITERATION : 2
Total number of functions: 2
Total number of basic blocks: 8
Total number of instructions: 20
Total number of call instructions: 2
Total number of direct-call instructions: 2
Total number of indirect-call instructions: 0
[test.c] Function: p
-------------------------------------

Basic block 6: if.end4_p (Predecessors: [if.end_p, if.then_p]-------Successors: [])
BB_OUT : 
 [13][12] return result.1_p
 [12]result.1_p = phi(mul_p, result.0_p)
BB_IN : mul_p  result.0_p  
===========================================================

Basic block 1: if.then_p (Predecessors: [entry]-------Successors: [if.end4_p------6])
BB_OUT : mul_p  result.0_p  
 [3][6] branch if.end4_p
 [2][5] mul_p = x_p * 2
BB_IN : result.0_p  x_p  
===========================================================

Basic block 5: if.end_p (Predecessors: [if.else3_p, if.then2_p]-------Successors: [if.end4_p------6])
BB_OUT : mul_p  result.0_p  
 [11]branch if.end4_p
 [10]result.0_p = phi(div_p, add_p)
BB_IN : add_p  div_p  mul_p  
===========================================================

Basic block 3: if.then2_p (Predecessors: [if.else_p]-------Successors: [if.end_p------5])
BB_OUT : add_p  div_p  mul_p  
 [7][8] branch if.end_p
 [6][7] div_p = x_p / 3
BB_IN : add_p  mul_p  x_p  
===========================================================

Basic block 4: if.else3_p (Predecessors: [if.else_p]-------Successors: [if.end_p------5])
BB_OUT : add_p  div_p  mul_p  
 [9]branch if.end_p
 [8][9] add_p = x_p + 1
BB_IN : div_p  mul_p  x_p  
===========================================================

Basic block 2: if.else_p (Predecessors: [entry]-------Successors: [if.then2_p------3 , if.else3_p------4])
BB_OUT : add_p  div_p  mul_p  x_p  
 [5][6] branch (cmp1_p) if.then2_p, if.else3_p
 [4][6] cmp1_p = x_p == 0
BB_IN : add_p  div_p  mul_p  x_p  
===========================================================

Basic block 0: entry (Predecessors: []-------Successors: [if.then_p------1 , if.else_p------2])
BB_OUT : add_p  div_p  mul_p  result.0_p  x_p  
 [1][4] branch (cmp_p) if.then_p, if.else_p
 [0][4] cmp_p = x_p > 0
BB_IN : add_p  div_p  mul_p  result.0_p  x_p  
===========================================================
[test.c] Function: main
-------------------------------------

Basic block 7: entry (Predecessors: []-------Successors: [])
BB_OUT : 
 [19][18] return call1_main
 [18][18] call1_main = call p(i_main)
 [17][18] <x_p, 1> = <i_main, 1>
 [16][18] <i_main, 1> = <x_main, 1>
 [15][17] call = call __isoc99_scanf(.str[0][0], x_main)
 [14]ALLOCA
BB_IN : call1_main  
===========================================================

ITERATION : 1
[test.c] Function: p
-------------------------------------

Basic block 6: if.end4_p (Predecessors: [if.end_p, if.then_p]-------Successors: [])
BB_OUT : 
 [13][12] return result.1_p
 [12]result.1_p = phi(mul_p, result.0_p)
BB_IN : mul_p  result.0_p  
===========================================================

Basic block 1: if.then_p (Predecessors: [entry]-------Successors: [if.end4_p------6])
BB_OUT : mul_p  result.0_p  
 [3][6] branch if.end4_p
 [2][5] mul_p = x_p * 2
BB_IN : result.0_p  x_p  
===========================================================

Basic block 5: if.end_p (Predecessors: [if.else3_p, if.then2_p]-------Successors: [if.end4_p------6])
BB_OUT : mul_p  result.0_p  
 [11]branch if.end4_p
 [10]result.0_p = phi(div_p, add_p)
BB_IN : add_p  div_p  mul_p  
===========================================================

Basic block 3: if.then2_p (Predecessors: [if.else_p]-------Successors: [if.end_p------5])
BB_OUT : add_p  div_p  mul_p  
 [7][8] branch if.end_p
 [6][7] div_p = x_p / 3
BB_IN : add_p  mul_p  x_p  
===========================================================

Basic block 4: if.else3_p (Predecessors: [if.else_p]-------Successors: [if.end_p------5])
BB_OUT : add_p  div_p  mul_p  
 [9]branch if.end_p
 [8][9] add_p = x_p + 1
BB_IN : div_p  mul_p  x_p  
===========================================================

Basic block 2: if.else_p (Predecessors: [entry]-------Successors: [if.then2_p------3 , if.else3_p------4])
BB_OUT : add_p  div_p  mul_p  x_p  
 [5][6] branch (cmp1_p) if.then2_p, if.else3_p
 [4][6] cmp1_p = x_p == 0
BB_IN : add_p  div_p  mul_p  x_p  
===========================================================

Basic block 0: entry (Predecessors: []-------Successors: [if.then_p------1 , if.else_p------2])
BB_OUT : add_p  div_p  mul_p  result.0_p  x_p  
 [1][4] branch (cmp_p) if.then_p, if.else_p
 [0][4] cmp_p = x_p > 0
BB_IN : add_p  div_p  mul_p  result.0_p  x_p  
===========================================================
[test.c] Function: main
-------------------------------------

Basic block 7: entry (Predecessors: []-------Successors: [])
BB_OUT : 
 [19][18] return call1_main
 [18][18] call1_main = call p(i_main)
 [17][18] <x_p, 1> = <i_main, 1>
 [16][18] <i_main, 1> = <x_main, 1>
 [15][17] call = call __isoc99_scanf(.str[0][0], x_main)
 [14]ALLOCA
BB_IN : call1_main  
===========================================================

ITERATION : 2
Total number of functions: 2
Total number of basic blocks: 8
Total number of instructions: 20
Total number of call instructions: 2
Total number of direct-call instructions: 2
Total number of indirect-call instructions: 0
[test.c] Function: p
-------------------------------------

Basic block 6: if.end4_p (Predecessors: [if.end_p, if.then_p]-------Successors: [])
BB_OUT : 
 [13][12] return result.1_p
 [12]result.1_p = phi(mul_p, result.0_p)
BB_IN : mul_p  result.0_p  
===========================================================

Basic block 1: if.then_p (Predecessors: [entry]-------Successors: [if.end4_p------6])
BB_OUT : mul_p  result.0_p  
 [3][6] branch if.end4_p
 [2][5] mul_p = x_p * 2
BB_IN : result.0_p  x_p  
===========================================================

Basic block 5: if.end_p (Predecessors: [if.else3_p, if.then2_p]-------Successors: [if.end4_p------6])
BB_OUT : mul_p  result.0_p  
 [11]branch if.end4_p
 [10]result.0_p = phi(div_p, add_p)
BB_IN : add_p  div_p  mul_p  
===========================================================

Basic block 3: if.then2_p (Predecessors: [if.else_p]-------Successors: [if.end_p------5])
BB_OUT : add_p  div_p  mul_p  
 [7][8] branch if.end_p
 [6][7] div_p = x_p / 3
BB_IN : add_p  mul_p  x_p  
===========================================================

Basic block 4: if.else3_p (Predecessors: [if.else_p]-------Successors: [if.end_p------5])
BB_OUT : add_p  div_p  mul_p  
 [9]branch if.end_p
 [8][9] add_p = x_p + 1
BB_IN : div_p  mul_p  x_p  
===========================================================

Basic block 2: if.else_p (Predecessors: [entry]-------Successors: [if.then2_p------3 , if.else3_p------4])
BB_OUT : add_p  div_p  mul_p  x_p  
 [5][6] branch (cmp1_p) if.then2_p, if.else3_p
 [4][6] cmp1_p = x_p == 0
BB_IN : add_p  div_p  mul_p  x_p  
===========================================================

Basic block 0: entry (Predecessors: []-------Successors: [if.then_p------1 , if.else_p------2])
BB_OUT : add_p  div_p  mul_p  result.0_p  x_p  
 [1][4] branch (cmp_p) if.then_p, if.else_p
 [0][4] cmp_p = x_p > 0
BB_IN : add_p  div_p  mul_p  result.0_p  x_p  
===========================================================
[test.c] Function: main
-------------------------------------

Basic block 7: entry (Predecessors: []-------Successors: [])
BB_OUT : 
 [19][18] return call1_main
 [18][18] call1_main = call p(i_main)
 [17][18] <x_p, 1> = <i_main, 1>
 [16][18] <i_main, 1> = <x_main, 1>
 [15][17] call = call __isoc99_scanf(.str[0][0], x_main)
 [14]ALLOCA
BB_IN : call1_main  
===========================================================

ITERATION : 1
[test.c] Function: p
-------------------------------------

Basic block 6: if.end4_p (Predecessors: [if.end_p, if.then_p]-------Successors: [])
BB_OUT : 
 [13][12] return result.1_p
 [12]result.1_p = phi(mul_p, result.0_p)
BB_IN : mul_p  result.0_p  
===========================================================

Basic block 1: if.then_p (Predecessors: [entry]-------Successors: [if.end4_p------6])
BB_OUT : mul_p  result.0_p  
 [3][6] branch if.end4_p
 [2][5] mul_p = x_p * 2
BB_IN : result.0_p  x_p  
===========================================================

Basic block 5: if.end_p (Predecessors: [if.else3_p, if.then2_p]-------Successors: [if.end4_p------6])
BB_OUT : mul_p  result.0_p  
 [11]branch if.end4_p
 [10]result.0_p = phi(div_p, add_p)
BB_IN : add_p  div_p  mul_p  
===========================================================

Basic block 3: if.then2_p (Predecessors: [if.else_p]-------Successors: [if.end_p------5])
BB_OUT : add_p  div_p  mul_p  
 [7][8] branch if.end_p
 [6][7] div_p = x_p / 3
BB_IN : add_p  mul_p  x_p  
===========================================================

Basic block 4: if.else3_p (Predecessors: [if.else_p]-------Successors: [if.end_p------5])
BB_OUT : add_p  div_p  mul_p  
 [9]branch if.end_p
 [8][9] add_p = x_p + 1
BB_IN : div_p  mul_p  x_p  
===========================================================

Basic block 2: if.else_p (Predecessors: [entry]-------Successors: [if.then2_p------3 , if.else3_p------4])
BB_OUT : add_p  div_p  mul_p  x_p  
 [5][6] branch (cmp1_p) if.then2_p, if.else3_p
 [4][6] cmp1_p = x_p == 0
BB_IN : add_p  div_p  mul_p  x_p  
===========================================================

Basic block 0: entry (Predecessors: []-------Successors: [if.then_p------1 , if.else_p------2])
BB_OUT : add_p  div_p  mul_p  result.0_p  x_p  
 [1][4] branch (cmp_p) if.then_p, if.else_p
 [0][4] cmp_p = x_p > 0
BB_IN : add_p  div_p  mul_p  result.0_p  x_p  
===========================================================
[test.c] Function: main
-------------------------------------

Basic block 7: entry (Predecessors: []-------Successors: [])
BB_OUT : 
 [19][18] return call1_main
 [18][18] call1_main = call p(i_main)
 [17][18] <x_p, 1> = <i_main, 1>
 [16][18] <i_main, 1> = <x_main, 1>
 [15][17] call = call __isoc99_scanf(.str[0][0], x_main)
 [14]ALLOCA
BB_IN : call1_main  
===========================================================

ITERATION : 2
Total number of functions: 0
Total number of basic blocks: 0
Total number of instructions: 0
Total number of call instructions: 0
Total number of direct-call instructions: 0
Total number of indirect-call instructions: 0

ITERATION : 1
Total number of functions: 1
Total number of basic blocks: 4
Total number of instructions: 38
Total number of call instructions: 1
Total number of direct-call instructions: 1
Total number of indirect-call instructions: 0
[test.c] Function: main
-------------------------------------

Basic block 3: if.end_main (Predecessors: [if.else_main, if.then_main]-------Successors: [])
BB_OUT : 
 [37][27] return 0
 [36][26] <q_main, 1> = <add4_main, 1>
 [35][26] add4_main = i12_main + i13_main
 [34][26] <i13_main, 1> = <r_main, 1>
 [33][26] <i12_main, 1> = <v_main, 1>
BB_IN : 0  
===========================================================

Basic block 1: if.then_main (Predecessors: [entry]-------Successors: [if.end_main------3])
BB_OUT : 0  
 [27][23] branch if.end_main
 [26][22] <v_main, 1> = <add2_main, 1>
 [25][22] add2_main = i8_main + i9_main
 [24][22] <i9_main, 1> = <u_main, 1>
 [23][22] <i8_main, 1> = <r_main, 1>
BB_IN : 0  
===========================================================

Basic block 2: if.else_main (Predecessors: [entry]-------Successors: [if.end_main------3])
BB_OUT : 0  
 [32]branch if.end_main
 [31][24] <q_main, 1> = <mul3_main, 1>
 [30][24] mul3_main = i10_main * i11_main
 [29][24] <i11_main, 1> = <v_main, 1>
 [28][24] <i10_main, 1> = <s_main, 1>
BB_IN : 0  
===========================================================

Basic block 0: entry (Predecessors: []-------Successors: [if.then_main------1 , if.else_main------2])
BB_OUT : 0  
 [22][21] branch (cmp_main) if.then_main, if.else_main
 [21][21] cmp_main = i6_main < i7_main
 [20][21] <i7_main, 1> = <q_main, 1>
 [19][21] <i6_main, 1> = <p_main, 1>
 [18][20] <u_main, 1> = <mul_main, 1>
 [17][20] mul_main = i4_main * i5_main
 [16][20] <i5_main, 1> = <v_main, 1>
 [15][20] <i4_main, 1> = <s_main, 1>
 [14][19] <s_main, 1> = <add1_main, 1>
 [13][19] add1_main = i2_main + i3_main
 [12][19] <i3_main, 1> = <q_main, 1>
 [11][19] <i2_main, 1> = <p_main, 1>
 [10][18] <p_main, 1> = <add_main, 1>
 [9][18] add_main = i_main + i1_main
 [8][18] <i1_main, 1> = <r_main, 1>
 [7][18] <i_main, 1> = <q_main, 1>
 [6][17] call = call __isoc99_scanf(.str[0][0], p_main, q_main, r_main, s_main, u_main, v_main)
 [5]ALLOCA
 [4]ALLOCA
 [3]ALLOCA
 [2]ALLOCA
 [1]ALLOCA
 [0]ALLOCA
BB_IN : 0  q_main  r_main  
===========================================================

ITERATION : 1
[test.c] Function: main
-------------------------------------

Basic block 3: if.end_main (Predecessors: [if.else_main, if.then_main]-------Successors: [])
BB_OUT : 
 [37][27] return 0
 [36][26] <q_main, 1> = <add4_main, 1>
 [35][26] add4_main = i12_main + i13_main
 [34][26] <i13_main, 1> = <r_main, 1>
 [33][26] <i12_main, 1> = <v_main, 1>
BB_IN : 0  
===========================================================

Basic block 1: if.then_main (Predecessors: [entry]-------Successors: [if.end_main------3])
BB_OUT : 0  
 [27][23] branch if.end_main
 [26][22] <v_main, 1> = <add2_main, 1>
 [25][22] add2_main = i8_main + i9_main
 [24][22] <i9_main, 1> = <u_main, 1>
 [23][22] <i8_main, 1> = <r_main, 1>
BB_IN : 0  
===========================================================

Basic block 2: if.else_main (Predecessors: [entry]-------Successors: [if.end_main------3])
BB_OUT : 0  
 [32]branch if.end_main
 [31][24] <q_main, 1> = <mul3_main, 1>
 [30][24] mul3_main = i10_main * i11_main
 [29][24] <i11_main, 1> = <v_main, 1>
 [28][24] <i10_main, 1> = <s_main, 1>
BB_IN : 0  
===========================================================

Basic block 0: entry (Predecessors: []-------Successors: [if.then_main------1 , if.else_main------2])
BB_OUT : 0  
 [22][21] branch (cmp_main) if.then_main, if.else_main
 [21][21] cmp_main = i6_main < i7_main
 [20][21] <i7_main, 1> = <q_main, 1>
 [19][21] <i6_main, 1> = <p_main, 1>
 [18][20] <u_main, 1> = <mul_main, 1>
 [17][20] mul_main = i4_main * i5_main
 [16][20] <i5_main, 1> = <v_main, 1>
 [15][20] <i4_main, 1> = <s_main, 1>
 [14][19] <s_main, 1> = <add1_main, 1>
 [13][19] add1_main = i2_main + i3_main
 [12][19] <i3_main, 1> = <q_main, 1>
 [11][19] <i2_main, 1> = <p_main, 1>
 [10][18] <p_main, 1> = <add_main, 1>
 [9][18] add_main = i_main + i1_main
 [8][18] <i1_main, 1> = <r_main, 1>
 [7][18] <i_main, 1> = <q_main, 1>
 [6][17] call = call __isoc99_scanf(.str[0][0], p_main, q_main, r_main, s_main, u_main, v_main)
 [5]ALLOCA
 [4]ALLOCA
 [3]ALLOCA
 [2]ALLOCA
 [1]ALLOCA
 [0]ALLOCA
BB_IN : 0  q_main  r_main  
===========================================================

ITERATION : 2
Total number of functions: 1
Total number of basic blocks: 4
Total number of instructions: 38
Total number of call instructions: 1
Total number of direct-call instructions: 1
Total number of indirect-call instructions: 0
[test.c] Function: main
-------------------------------------

Basic block 3: if.end_main (Predecessors: [if.else_main, if.then_main]-------Successors: [])
BB_OUT : 
 [37][27] return 0
 [36][26] <q_main, 1> = <add4_main, 1>
 [35][26] add4_main = i12_main + i13_main
 [34][26] <i13_main, 1> = <r_main, 1>
 [33][26] <i12_main, 1> = <v_main, 1>
BB_IN : 0  
===========================================================

Basic block 1: if.then_main (Predecessors: [entry]-------Successors: [if.end_main------3])
BB_OUT : 0  
 [27][23] branch if.end_main
 [26][22] <v_main, 1> = <add2_main, 1>
 [25][22] add2_main = i8_main + i9_main
 [24][22] <i9_main, 1> = <u_main, 1>
 [23][22] <i8_main, 1> = <r_main, 1>
BB_IN : 0  
===========================================================

Basic block 2: if.else_main (Predecessors: [entry]-------Successors: [if.end_main------3])
BB_OUT : 0  
 [32]branch if.end_main
 [31][24] <q_main, 1> = <mul3_main, 1>
 [30][24] mul3_main = i10_main * i11_main
 [29][24] <i11_main, 1> = <v_main, 1>
 [28][24] <i10_main, 1> = <s_main, 1>
BB_IN : 0  
===========================================================

Basic block 0: entry (Predecessors: []-------Successors: [if.then_main------1 , if.else_main------2])
BB_OUT : 0  
 [22][21] branch (cmp_main) if.then_main, if.else_main
 [21][21] cmp_main = i6_main < i7_main
 [20][21] <i7_main, 1> = <q_main, 1>
 [19][21] <i6_main, 1> = <p_main, 1>
 [18][20] <u_main, 1> = <mul_main, 1>
 [17][20] mul_main = i4_main * i5_main
 [16][20] <i5_main, 1> = <v_main, 1>
 [15][20] <i4_main, 1> = <s_main, 1>
 [14][19] <s_main, 1> = <add1_main, 1>
 [13][19] add1_main = i2_main + i3_main
 [12][19] <i3_main, 1> = <q_main, 1>
 [11][19] <i2_main, 1> = <p_main, 1>
 [10][18] <p_main, 1> = <add_main, 1>
 [9][18] add_main = i_main + i1_main
 [8][18] <i1_main, 1> = <r_main, 1>
 [7][18] <i_main, 1> = <q_main, 1>
 [6][17] call = call __isoc99_scanf(.str[0][0], p_main, q_main, r_main, s_main, u_main, v_main)
 [5]ALLOCA
 [4]ALLOCA
 [3]ALLOCA
 [2]ALLOCA
 [1]ALLOCA
 [0]ALLOCA
BB_IN : 0  q_main  r_main  
===========================================================

ITERATION : 1
[test.c] Function: main
-------------------------------------

Basic block 3: if.end_main (Predecessors: [if.else_main, if.then_main]-------Successors: [])
BB_OUT : 
 [37][27] return 0
 [36][26] <q_main, 1> = <add4_main, 1>
 [35][26] add4_main = i12_main + i13_main
 [34][26] <i13_main, 1> = <r_main, 1>
 [33][26] <i12_main, 1> = <v_main, 1>
BB_IN : 0  
===========================================================

Basic block 1: if.then_main (Predecessors: [entry]-------Successors: [if.end_main------3])
BB_OUT : 0  
 [27][23] branch if.end_main
 [26][22] <v_main, 1> = <add2_main, 1>
 [25][22] add2_main = i8_main + i9_main
 [24][22] <i9_main, 1> = <u_main, 1>
 [23][22] <i8_main, 1> = <r_main, 1>
BB_IN : 0  
===========================================================

Basic block 2: if.else_main (Predecessors: [entry]-------Successors: [if.end_main------3])
BB_OUT : 0  
 [32]branch if.end_main
 [31][24] <q_main, 1> = <mul3_main, 1>
 [30][24] mul3_main = i10_main * i11_main
 [29][24] <i11_main, 1> = <v_main, 1>
 [28][24] <i10_main, 1> = <s_main, 1>
BB_IN : 0  
===========================================================

Basic block 0: entry (Predecessors: []-------Successors: [if.then_main------1 , if.else_main------2])
BB_OUT : 0  
 [22][21] branch (cmp_main) if.then_main, if.else_main
 [21][21] cmp_main = i6_main < i7_main
 [20][21] <i7_main, 1> = <q_main, 1>
 [19][21] <i6_main, 1> = <p_main, 1>
 [18][20] <u_main, 1> = <mul_main, 1>
 [17][20] mul_main = i4_main * i5_main
 [16][20] <i5_main, 1> = <v_main, 1>
 [15][20] <i4_main, 1> = <s_main, 1>
 [14][19] <s_main, 1> = <add1_main, 1>
 [13][19] add1_main = i2_main + i3_main
 [12][19] <i3_main, 1> = <q_main, 1>
 [11][19] <i2_main, 1> = <p_main, 1>
 [10][18] <p_main, 1> = <add_main, 1>
 [9][18] add_main = i_main + i1_main
 [8][18] <i1_main, 1> = <r_main, 1>
 [7][18] <i_main, 1> = <q_main, 1>
 [6][17] call = call __isoc99_scanf(.str[0][0], p_main, q_main, r_main, s_main, u_main, v_main)
 [5]ALLOCA
 [4]ALLOCA
 [3]ALLOCA
 [2]ALLOCA
 [1]ALLOCA
 [0]ALLOCA
BB_IN : 0  q_main  r_main  
===========================================================

ITERATION : 2
