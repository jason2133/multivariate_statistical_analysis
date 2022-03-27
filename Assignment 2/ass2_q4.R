# Q4
a4 <- c(9, -2, -2, 6)
a4

dim(a4) <- c(2, 2)
a4

a4.S <- cov(a4)
a4.S

# 고유값 분해
a4.ED <- eigen(a4.S)
a4.ED

print(a4.ED$values)
print(a4.ED$vectors)

# 고유값 출력

##### Q4 다시
a4_1 <- matrix(c(9, -2, -2, 6), nc=2, byrow=FALSE)
a4_1

# eigenvalue & eigenvector of matrix A
lambda_A <- eigen(a4_1)
lambda_A

lambda_A$values[[1]]
lambda_A$vectors[, 1]

lambda_A$values[[2]]
lambda_A$vectors[, 2]

#### 고유값 구현 관련
a5_1 <- matrix(c(1, -2, 2, 1), nc=2,byrow=FALSE)
a5_1
a5_3 <- matrix(c(1, 2, -2, 1), nc=2, byrow=FALSE)
a5_3
a5_2 <- matrix(c(10, 0, 0, 5), nc=2, byrow=FALSE)
a5_2

a5_1 %*% a5_2 %*% a5_3

a5_3 %*% a5_2 %*% a5_1

a5_4 <- matrix(c(-2, 1, 1, 2), nc=2, byrow=FALSE)
a5_4

a5_5 = solve(a5_4)
a5_5
a5_4 %*% a5_5

a5_2

a5_4 %*% a5_2 %*% a5_5
a5_4
a5_2
a5_5

a5_4_2 <- t(a5_4)
a5_4_2
a5_4

a5_4 %*% a5_2 %*% a5_4_2


#### Q5 letsgo
b5 <- matrix(c(5, -2, -2, 2), nc=2, byrow=FALSE)
b5
b5_s <- solve(b5)
b5_s

b5_1 <- matrix(c(3, -3), nc=2, byrow=FALSE)
b5_1
b5_3 <- t(b5_1)
b5_3
dim(b5_3)
dim(b5_1)

b5_1 %*% b5_s %*% b5_3
