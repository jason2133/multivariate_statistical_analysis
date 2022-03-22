# Checking distributional assumptions using probability plots

# Example 1

### A dataset with 50 observations and 5 variables from a multivariate normal distribution

# Generate multivariate standard normal random numbers with n=50 and rho=0.5
n = 50
p = 5

mu = rep(0, p)
mu

vmat = matrix(0.5, p, p) + 0.5*diag(p)
vmat

library(MASS)
mvdata1 = mvrnorm(n, mu, vmat)
mvdata1

# Normal probabiltiy plot for individual variables
# Define the layout.
nf = layout(matrix(c(1:6),3,2,byrow=TRUE))
layout.show(nf)

# Draw normal probability plots
for(i in 1:p){qqnorm(mvdata[,i],xlab="Quantiles of Standard Normal",ylab=paste("Var",i))}

# Calculate the distance
Sx = cov(mvdata1)
Sx

di2 = mahalanobis(mvdata1, colMeans(mvdata1), Sx)
di2

# Draw the chi-square probability plot;
library(lattice) 
qqmath(di2,distribution = function(p) qchisq(p,df=5))
