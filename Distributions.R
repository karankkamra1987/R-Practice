# THE NORMAL DISTRIBUTION
pnorm(1.43) # finds P(Z < 1.43)
pnorm(129,100,16) # finds P(X < 129) where x comes from normal with mean 100 and std dev 16
qnorm(.994) # finds the .994 quantile of the standard normal
qnorm(.95,100,16) # finds the .95 quantile of N(100,16)distribution 

# THINGS TO KNOW
x <- runif(30,0,1) # creates a vector 30 long
x # of random values from U(0,1)
y <- c() # before you can use a vector in a loop you must "save space" for it by typing the y <- c() command 7
for (i in 1:10) {y[i] <- rbinom(1,3,.2)}
y
s <- c(1:5) # for R you can use <- or = for a variable assignment
s 
t = c(2:6)
t 