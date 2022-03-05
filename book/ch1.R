a1 <- c(2, 12, 8, 18, 4, 5, 4, 3)
a1
dim(a1) <- c(4, 2)
a1

# (표본) 평균 벡터
summary(a1)

# 표본 공분산
cov(a1)

# 상관행렬
cor(a1)

# 산점도 행렬
pairs(a1)

# Num 3
company <- read.csv('C:/Users/jason/바탕 화면/coding1/multivariate_data_analysis/book_problem/data/company.csv', header=TRUE)
company

companyX <- company[-1]
companyX

companyrealX <- subset(company, select=-c(ID, class))
companyrealX

# 데이터 요약
summary(companyrealX)

# 3-a
# 산점도 행렬
pairs(companyrealX)

# 3-b
# 표본 공분산
cov(companyrealX)

# 상관행렬
cor(companyrealX)

# 4-a
# scale 함수를 이용하여 중심화된 자료행렬 C와 표준화된 자료행렬 Z를 구하여라.
# 중심화
company.C <- scale(companyrealX, center=TRUE, scale=FALSE)
print(company.C)

# 표준화
company.Z <- scale(companyrealX, center=TRUE, scale=TRUE)
print(company.Z)

# 4-b
# cov 함수를 이용하여 표준화된 자료행렬 Z로부터 공분산행렬 Sz를 얻고, 이것이 문제 3에서 구한 Rx와 같음을 확인하여라.
cov(company.Z)
cor(companyrealX)

# 4-c
# 각 집단별로 평균벡터와 표준편차를 구하고 이를 비교하여라.
# aggregate 함수 또는 tapply 함수를 이용하여라.
# 여기서 각 집단이란, class를 의미한다.

# 아래 둘이 같음.
# 평균 mean
aggregate(company$x1, by=list(company$class), mean)
aggregate(x1~class, company, mean)

aggregate(company$x1, by=list(company$class), sd)
aggregate(x1~class, company, sd)

# 아래 둘도 같음.
# 표준편차 sd
aggregate(company$x2, by=list(company$class), mean)
aggregate(x2~class, company, mean)

aggregate(company$x2, by=list(company$class), sd)
aggregate(x2~class, company, sd)

# x1 ~ x8
aggregate(x1~class, company, mean)
aggregate(x2~class, company, mean)
aggregate(x3~class, company, mean)
aggregate(x4~class, company, mean)
aggregate(x5~class, company, mean)
aggregate(x6~class, company, mean)
aggregate(x7~class, company, mean)
aggregate(x8~class, company, mean)

library(plotrix)
x1.class1 <- c(1.122, 12.025, 178, 55.650, 3.225, 6836, 41.2, 0.638)
# ladderplot(x1.class1, scale=FALSE, lty=1, pch=1:8, col=1:8, ylim=c(0, 200), vertical=TRUE)

company.part <- company[c(2, 3, 4, 5, 6, 7, 8, 9)]
company.part

ladderplot(company.part, scale=FALSE, lty=1, pch=1:8, col=1:8, ylim=c(0, 20000), vertical=TRUE)

# 4-e
companyrealX

library(scales)
companyXscale <-as.data.frame(lapply(companyrealX, rescale))
companyXscale
cov(companyXscale)
cor(companyrealX)

# 별도표
stars(companyXscale, full=TRUE, scale=TRUE, radius=TRUE, draw.segments=TRUE,
      frame.plot=TRUE, labels=rownames(companyXscale), nrow=8, ncol=8,
      cex=0.8, len=0.8, lwd=1, axes=TRUE, ylim=c(1, 8), key.loc=c(7, 2))

# 개체별 레이더 도표





