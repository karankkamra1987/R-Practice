# INTRO TO GRAPHING 
# input a vector x with data
x <- c(2,4,4,6,6,5,5,7,3,7,3,8,9,7,9,6,4,3,4,4,6,2,2,1,2,4,6,6,8)
 # input vector y of consecutive numbers
 # 1 through 29
y <- c(1:29)
 # make a histogram of x
hist(x)
 # make a scatter plot of y vs x
plot(x,y)
 # make a time plot of x, connecting dots
plot(x, type="b")
 # make a histogram of a sampling of 20 from
 # the binomial distribution B(12,.4)
y <- rbinom(20, 12, .4)
hist(y)
 # make another binomial histogram, but using
a
 # sample of 200
y <- rbinom(200, 12, .4)
hist(y)
 # make a boxplot of x data
boxplot(x)
 # make side by side boxplots of x and y data
boxplot(x,y) 