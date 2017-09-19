dtmc

// constants
const int n;

module rdwalk
	x : [0..n+1] init 0;
    // loop
	[] x < n ->  0.25:(x' = x + 2) + 0.75:(x' = x + 1);
    // done
	[] x = n | x = n+1 -> true;
endmodule

// labels
label "finished" = x = n | x = n+1;

rewards "ticks"
	true : 1;
endrewards
