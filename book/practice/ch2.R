# Chapter 2

###########################################################
# Q1
student <- read.csv('C:/Users/jason/바탕 화면/coding1/multivariate_data_analysis/book/practice/student.csv', header=TRUE)
student

# 기술통계량
library(psych)
describe(student[c("x1","x2","x3","x4","x5")])

# 상관계수
cor(student[c("x1","x2","x3","x4","x5")])
corr.test(student[c("x1","x2","x3","x4","x5")])

# 주성분분석
cov(student[c("x1","x2","x3","x4","x5")])
student.prcomp <- prcomp(~x1+x2+x3+x4+x5,data=student)
print(student.prcomp)
student.prcomp$sdev
student.prcomp$sdev^2
summary(student.prcomp)

# 주성분점수
student.score <- cbind(student,student.prcomp$x[,1:2])
print(student.score)

# 주성분점수 플롯
plot(student.score[c("PC1","PC2")])
abline(h=0,v=0)
text(student.score[c("PC1","PC2")],
     labels=rownames(student.score),pos=2)

# 주성분 행렬도
biplot(student.prcomp,cex=1)
abline(h=0,v=0,lty=2)

###########################################################
# Q2
### Q2-a
socioeco <- read.csv('C:/Users/jason/바탕 화면/coding1/multivariate_data_analysis/book/practice/socioeco.csv', header=TRUE)
socioeco

library(psych)
describe(socioeco)

cov(socioeco)

# 주성분 분석
socioeco.prcomp <- prcomp(socioeco)
print(socioeco.prcomp)

socioeco.prcomp$sdev

socioeco.prcomp$sdev^2

summary(socioeco.prcomp)

# 주성분 행렬도
biplot(socioeco.prcomp,cex=1)

abline(h=0,v=0,lty=2)

### Q2-b
cor(socioeco)

# 주성분 분석
socioeco.prin <- prcomp(socioeco,center=TRUE,scale=TRUE)
print(socioeco.prin)
socioeco.prin$sdev
socioeco.prin$sdev^2
summary(socioeco.prin)

# 주성분 행렬도
biplot(socioeco.prin,cex=1)
abline(h=0,v=0,lty=2)

###########################################################
# Q4
### Q4-a
Sigma <- matrix(c(10000,60,60,1),nrow=2)

D <- diag(diag(Sigma))

sqrt.D <- sqrt(D)

P <- solve(sqrt.D)%*%Sigma%*%solve(sqrt.D)

print(P)

### Q4-b
eigen(Sigma)

Sigma.princomp <- princomp(covmat=Sigma)

Sigma.princomp$sdev^2

summary(Sigma.princomp,loadings=T,cutoff=0.0001)

### Q4-c
eigen(P)

P.princomp <- princomp(covmat=P)

P.princomp$sdev^2

summary(P.princomp,loadings=T,cutoff=0.0001)

###########################################################
# Q5
### Q5-a
Sigma <- matrix(c(5,-3,0,-3,4,0,0,0,2),nrow=3)

eigen(Sigma)

Sigma.princomp <- princomp(covmat=Sigma)

Sigma.princomp$sdev^2

summary(Sigma.princomp,loadings=T,cutoff=0.0001)

###########################################################
# Q6
Sigma <- matrix(c(5,0,0,0,1,0,0,0,2),nrow=3)

eigen(Sigma)

Sigma.princomp <- princomp(covmat=Sigma)

Sigma.princomp$sdev^2

summary(Sigma.princomp,loadings=T,cutoff=0.0001)

###########################################################
# Q7
tvad.T.prcomp <- prcomp(tvad.T)

tvad.T.prcomp$sdev^2

summary(tvad.T.prcomp)

###########################################################
# Q8
### Q8-a
satis.X <- satis[c("x1","x2","x3","x4","x5")]
satis.C <- scale(satis.X,center=TRUE,scale=FALSE)
satis.C

### Q8-b
svd(satis.C)
svd(satis.C/sqrt(nrow(satis.C)-1))

### Q8-c
satis.CC <- t(satis.C)%*%satis.C
eigen(satis.CC)
eigen(satis.CC/(nrow(satis.C)-1))

###########################################################

