# prism_examples
Some probabilistic model examples

# Compute probabilities of well-known distribution
- Go to "gsl_prob"
- run make
- gsl_caller 7 x mu sigma number_of_tries

It computes the cumulative probability that the value of normal random variable X is smaller than x, 
or P(X < x). The parameter mu is the mean, sigma is the variance, and number_of_tries is the number 
of sampling.

# Attacker model

- The probabilities that the attacker has the correct evaluation that her guess is smaller than 
the secret is represented by the parameter p1 (computed by gsl_caller program)

- The probabilities that the attacker has the correct evaluation that her guess is bigger than 
the secret is represented by the parameter p2 (computed by gsl_caller program)

- The property P=? [ F success ] computes the range of probability that the attacker reveals 
successfully the secret

- P<=0.8 [F success ] asserts that the probability of success is smaller than 0.8

- P>=0.6 [F success ] asserts that the probability of success is bigger than 0.6

- P>=1.0 [ F "finished" ] asserts that the probability that the program terminates is 1, or it is 
almost sure termination

# Verification results

- Look at the file "verification_results.txt"