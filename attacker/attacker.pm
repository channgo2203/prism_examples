// modelled as a discrete time Markov chain
dtmc

// constants
const int w1 = 128;
const int w2 = 64;
const int w3 = 32;
const int w4 = 16;
const int w5 = 8;
const int w6 = 4;
const int w7 = 2;
const int w8 = 1;
const int nsteps = 8;

// probabilities of checking that guess is smaller than secret
const double p1 = 0.9994;
// probabilities of checking that guess is bigger than secret
const double p2 = 0.9994;

module attacker

	secretMin : [0..255];
	secret : [0..255];
	steps : [1..nsteps];

	check : bool;
	done : bool;

	success : bool;
	
	// step 1
	[] secretMin = 0 & steps = 1 & secretMin + w1 <= secret -> p1:(secretMin'=secretMin+w1)&(steps'=steps+1) + (1-p1):(secretMin'=secretMin)&(steps'=steps+1);
	[] secretMin = 0 & steps = 1 & secretMin + w1 > secret -> (1-p2):(secretMin'=secretMin+w1)&(steps'=steps+1) + p2:(secretMin'=secretMin)&(steps'=steps+1);
	
	// step 2
	[] secretMin <= w1 & steps = 2 & secretMin + w2 <= secret -> p1:(secretMin'=secretMin+w2)&(steps'=steps+1) + (1-p1):(secretMin'=secretMin)&(steps'=steps+1);
	[] secretMin <= w1 & steps = 2 & secretMin + w2 > secret -> (1-p2):(secretMin'=secretMin+w2)&(steps'=steps+1) + p2:(secretMin'=secretMin)&(steps'=steps+1);
	
	// step 3
	[] secretMin <= (w1 + w2) & steps = 3 & secretMin + w3 <= secret -> p1:(secretMin'=secretMin+w3)&(steps'=steps+1) + (1-p1):(secretMin'=secretMin)&(steps'=steps+1);
	[] secretMin <= (w1 + w2) & steps = 3 & secretMin + w3 > secret -> (1-p2):(secretMin'=secretMin+w3)&(steps'=steps+1) + p2:(secretMin'=secretMin)&(steps'=steps+1);
	
	// step 4
	[] secretMin <= (w1 + w2 + w3) & steps = 4 & secretMin + w4 <= secret -> p1:(secretMin'=secretMin+w4)&(steps'=steps+1) + (1-p1):(secretMin'=secretMin)&(steps'=steps+1);
	[] secretMin <= (w1 + w2 + w3) & steps = 4 & secretMin + w4 > secret -> (1-p2):(secretMin'=secretMin+w4)&(steps'=steps+1) + p2:(secretMin'=secretMin)&(steps'=steps+1);
	
	// step 5
	[] secretMin <= (w1 + w2 + w3 + w4) & steps = 5 & secretMin + w5 <= secret -> p1:(secretMin'=secretMin+w5)&(steps'=steps+1) + (1-p1):(secretMin'=secretMin)&(steps'=steps+1);
	[] secretMin <= (w1 + w2 + w3 + w4) & steps = 5 & secretMin + w5 > secret -> (1-p2):(secretMin'=secretMin+w5)&(steps'=steps+1) + p2:(secretMin'=secretMin)&(steps'=steps+1);
	
	// step 6
	[] secretMin <= (w1 + w2 + w3 + w4 + w5) & steps = 6 & secretMin + w6 <= secret -> p1:(secretMin'=secretMin+w6)&(steps'=steps+1) + (1-p1):(secretMin'=secretMin)&(steps'=steps+1);
	[] secretMin <= (w1 + w2 + w3 + w4 + w5) & steps = 6 & secretMin + w6 > secret -> (1-p2):(secretMin'=secretMin+w6)&(steps'=steps+1) + p2:(secretMin'=secretMin)&(steps'=steps+1);
	
	// step 7
	[] secretMin <= (w1 + w2 + w3 + w4 + w5 + w6) & steps = 7 & secretMin + w7 <= secret -> p1:(secretMin'=secretMin+w7)&(steps'=steps+1) + (1-p1):(secretMin'=secretMin)&(steps'=steps+1);
	[] secretMin <= (w1 + w2 + w3 + w4 + w5 + w6) & steps = 7 & secretMin + w7 > secret -> (1-p2):(secretMin'=secretMin+w7)&(steps'=steps+1) + p2:(secretMin'=secretMin)&(steps'=steps+1);

	// step 8
	[] secretMin <= (w1 + w2 + w3 + w4 + w5 + w6 + w7) & steps = 8 & secretMin + w8 <= secret -> p1:(secretMin'=secretMin+w8)&(check'=true) + (1-p1):(secretMin'=secretMin)&(check'=true);
	[] secretMin <= (w1 + w2 + w3 + w4 + w5 + w6 + w7) & steps = 8 & secretMin + w8 > secret -> (1-p2):(secretMin'=secretMin+w8)&(check'=true) + p2:(secretMin'=secretMin)&(check'=true);

	// check
	[] check & secretMin = secret -> (success'=true)&(done'=true);
	[] check & secretMin != secret -> (success'=false)&(done'=true);
	[] done -> true;

endmodule

// non-deterministic value of secret
init secretMin = 0 & steps = 1 & secret >= 0 & secret <= 255 & check = false & done = false & success = false endinit
 
// labels
label "finished" = done; 
