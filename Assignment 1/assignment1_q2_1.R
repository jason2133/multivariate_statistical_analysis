mydata <- read.table('C:/Users/jason/바탕 화면/고려대 통계학과/2022년 1학기/다변량/과제/assignment1/radiotherapy.dat', header=TRUE, stringsAsFactors=FALSE)
mydata

# Q2-a : error : 결측치 확인
is.na(mydata)
sum(is.na(mydata))
# 결측치가 없고 정상적으로 데이터가 98 x 6 형식으로 있으므로 데이터는 정상이다. 에러가 없다.

# Q2-b
summary(mydata)
cov(mydata)

# Q2-c
cor(mydata)

# Q2-d
# Draw Normal Probability Plots
# for(i in 1:p)(qqnorm(mydata[,i])

# for(i in 1:6)(qqnorm(mydata[,i]))

# qqnorm(mydata[, 1])  
# qqnorm(mydata[, 2])            
# qqnorm(mydata[, 6])

# for(i in 1:6)(qqnorm(mydata[,i]))

#qqnorm(mydata[, 1])
# qqnorm(mydata[, 2])
# qqnorm(mydata[, 3])
# qqnorm(mydata[, 4])
# qqnorm(mydata[, 5])
# qqnorm(mydata[, 6])

# Q2-f
library(MASS)

a <- c(3.542, 1.809, 2.138, 2.209, 2.575, 1.276)
b <- cov(mydata)

a
b

# mvdata = mvrnorm(98, mydata)
mvdata = mvrnorm(98, a, b)
mvdata

nf = layout(matrix(c(1:6), 3, 2, byrow=TRUE))
layout.show(nf)

# Draw normal probability plots
for (i in 1:6) {qqnorm(mvdata[,i])}

mvdata

# Q2-e
Sx = cov(mvdata)
di2 = mahalanobis(mvdata, colMeans(mvdata), Sx)
di2


