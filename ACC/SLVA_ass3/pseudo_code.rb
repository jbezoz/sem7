STRONG LIVE VARIABLE ANALYSIS


changed = 1 // flag for change in states
prev_state = PHI,current_state = PHI;
//only current _state is being updated BB_IN and BB_OUT values

while(changed)
{
	X is set of strongly live variables 
	while(all blocks not reverse traversed)
	{
		X = BB_OUT;
		X = X union succ of current_block;
		BB_OUT = X; // updating strong liveness in current block OUT
		//printing BB_OUT
		while(all lines not reverse traversed)	
		{
			temp_gen = {},temp_kill = {} // temp for each line
			case 1 : LOAD || STORE || BINARY OP || COMPARE
				LHS = insert in temp_kill,RHS  = insert in temp_gen; 
			case 2 : RETURN
				LHS = insert in temp_kill,RHS  = {}; 
			case 3 : ALLOCA
				LHS = {},RHS  = {}; 
			case 4 : PHI
				LHS = insert in temp_kill,RHS  = insert in temp_gen; 
			if(LHS not in X)// removing condition gives live variable analysis
				temp_gen = {};
			X = (X – temp_kill) U (temp_gen ∩ VAR);	
			//print in temp_gen,tem_kill
		}
		BB_IN = X;// updating strong liveness in current block IN
		//printing BB_IN 
		changed = (prev_state != current_state);
		BB_prev = BB_current;
	}
	
}

