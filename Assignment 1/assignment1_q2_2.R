mydata <- read.table('C:/Users/jason/바탕 화면/고려대 통계학과/2022년 1학기/다변량/과제/assignment1/radiotherapy.dat', header=TRUE, stringsAsFactors=FALSE)
mydata

# Q2-a
# error 없음
mydata
is.na(mydata)
sum(is.na(mydata))

# Q2-b
summary(mydata)
cov(mydata)

# Q2-c
cor(mydata)

# Q2-d
p = ncol(mydata)
p

nf = layout(matrix(c(1:6), 3, 2, byrow=TRUE))
layout.show(nf)

# Draw normal probability plots
for(i in 1:p){qqnorm(mydata[,i],xlab="Quantiles of Standard Normal",ylab=colnames(mydata)[i])}

# Q2-e
Sx = cov(mydata)
Sx
di2 = mahalanobis(mydata, colMeans(mydata), Sx)
di2

sort(di2)

# Q2-f
# Draw the chi-square probability plot;
library(lattice) 
qqmath(di2,distribution = function(p) qchisq(p,df=6))

# Q2-g
# box-cox transformation
mydata


library(AID)
# boxcoxnc(mydata$X1)

boxcoxnc(mydata$X2)
boxcoxnc(mydata$X3)
boxcoxnc(mydata$X4)
boxcoxnc(mydata$X5)

#################################################
before <- lm(X6 ~ X1, data=mydata)
summary(before)

par(mfrow=c(2, 2))
plot(before)

library(AID)
boxcoxnc(mydata$X1)

###################
boxcoxnc(mydata$X2)
boxcoxnc(mydata$X3)
boxcoxnc(mydata$X4)
boxcoxnc(mydata$X5)
# boxcoxnc(mydata$X6)
###################

###############################################################################
# library(MASS)
# boxcox(mydata)

colnames(mydata)[6]

library(MASS)

box.cox <- function(x, parms=c(1,0)) {
  lambda <- parms[1]
  offset <- parms[2]
  if (lambda==0) log(x+offset) else ((x+offset)^lambda - 1)/lambda
}
threepoint <- function(x, y, ladder=c(1, 1/2, 1/3, 0, -1/2, -1)) {
  # x and y are length-three samples from a dataset.
  dx <- diff(x)
  f <- function(parms) (diff(diff(box.cox(y, parms)) / dx))^2
  fit <- nlm(f, c(1,0))
  parms <- fit$estimate #$
  lambda <- ladder[which.min(abs(parms[1] - ladder))]
  if (lambda==0) offset = 0 else {
    do <- diff(range(y))
    offset <- optimize(function(x) f(c(lambda, x)), 
                       c(max(-min(x), parms[2]-do), parms[2]+do))$minimum    
  }
  c(lambda, offset)
}

b1 <- box.cox(mydata, mydata$X1)
b1

qqnorm(mydata, b1)

###
library(AID)
mydata
a1 <- mydata[,1]
a1

# boxcoxnc(data, method = "sw", lam = seq(-3,3,0.01), plotit = TRUE, alpha = 0.05,  verbose = TRUE)
a1_out <- boxcoxnc(a1, method = "pt", lam = seq(-3,3,0.01), plotit = TRUE, alpha = 0.05,  verbose = TRUE)
