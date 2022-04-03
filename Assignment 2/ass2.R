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


###
wiki <- matrix(c(1, 0, -2/3, 1), nc=2, byrow=FALSE)
wiki
wiki2 <- solve(wiki)
wiki2

### Q4_c
q4_1 <- matrix(c(1, 2, -2, 1), nc=2, byrow=FALSE)
q4_1
q4_2 <- matrix(c(5, 0, 0, 10), ncol=2, byrow=FALSE)
q4_2
q4_3 <- solve(q4_1)
q4_3

q4_4 <- q4_1 %*% q4_2 %*% q4_3
q4_4

q4_5 <- matrix(c(1/125, 0, 0, 1/1000), ncol=2, byrow=FALSE)
q4_5

q4_d <- q4_1 %*% q4_5 %*% q4_3
q4_d
q4_1
q4_5
q4_3
q4_d

q4_3_1 <- matrix(c(2.236, 0, 0, 3.162), ncol=2, byrow=FALSE)
q4_3_1

q4_e <- q4_1 %*% q4_3_1 %*% q4_3
q4_e
q4_1
q4_3_1
q4_3
q4_e

#################
q4_d_1 <- matrix(c(1, -2, 2, 1), ncol=2, byrow=FALSE)
q4_d_1
q4_d_2 <- solve(q4_d_1)
q4_d_2



