Run the script below, noticing what it does.
# VECTORS
x <- c(2,3,5,1,4,4) # create a row vector with those 6 numbers
 # and then call the vector x
x
sum(x) # sums the elements of vector x
mean(x) # finds the mean of vector x
sd(x) # finds standard deviation of vector x
median(x) # finds the median of x
sqrt(x) # finds square root of every element of x
x^2 # finds the square of every element of x

seq(1,10) # makes a vector 10 long, from 1 to 10, by l's
seq(1,10, 2) # makes a vector from 1 to 10,  # starting with 1, then skipping 1 ending up with only odds from 1 to 10
seq(1:10) # same as seq(1,10)
seq(1,10,by=2) # same as seq(1,10,2)

y <- c(1:7) # create a row vector with elements 1 through 6
ymean(seq)
z <- 1:7 # same as y--use when you increment by 1
only
z
w <- c(1:12,0,-6) # use the c( when you increment by 1
 # followed by more numbers not in
 # sequence
w
Now run the script below, noting what it does
# SOME OPERATIONS WITH NUMERICAL VECTORS AND LOGICAL VECTORS
x <- c(-5,0,7,-6,14,27) # data vector x
x[1] # prints first element of x
x[length(x)] # prints last element of x
x[i] # the ith entry if 1<=i<=n, NA if i>n,
all but
 # the ith if -n<=i<=-1, an error if i
< -n, and
 # an empty vector if i=0
x[c(2,3)] # the second and 3rd entries 
4
x[-c(2,3)] # all but the seccond and third entries
x[i] <- 5 # assign a value of 5 to the first entry;
 # also can use x[i] = 5
x[c(1,4)] <- c(2,3) # assign values to the first and fourth
entries
x[indices] <- y # assign to those indices indicated by
the values
 # of INDICES: if y is not long enough,
values
 # are recycled; if y is too long, just its
initial
 # values are used and a warning is issued
x < 3 # vector with length n of TRUE or FALSE
 # depending if x[i] < 3
which(x<3) # which indices correspond to the TRUE values
 # of x<3
x[x<3] # the x values when x<3 is TRUE -- same
# as x[which(x<3)] 