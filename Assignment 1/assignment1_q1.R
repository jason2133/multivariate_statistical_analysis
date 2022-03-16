# Q1
# data
a1 <- c(2, 5, 4, 8, 5, 6, 3, 2, 2, 0, 4, 1, 8, 4, 7, 5, 1, 5)
a1
dim(a1) <- c(6, 3)
a1

# Q1-a
summary(a1)
cov(a1)

# Q1-b
cor(a1)

# Q1-c
x1 <- c(2, 5, 4, 8, 5, 6)
x1
x2 <- c(3, 2, 2, 0, 4, 1)
x2
x3 <- c(8, 4, 7, 5, 1, 5)
x3
z1 <- 2*x1 + x2 - x3
z1
summary(z1)
mean(z1)
var(z1)

#Q1-d
z2 <- x1 + 2*x2 - 3*x3
z2
mean(z2)
var(z2)

# Q1-e
x1_1 <- (-1 * x1)
x1_1

x2_1 <- 2 * x3
x2_1

z3 <- c(x1_1, x2_1)
z3
dim(z3) <- c(6, 2)
z3

mean(z3)
cov(z3)

# Q1-f
z4 <- c(z1, z2, z3)
z4
dim(z4) <- c(6, 4)
z4
mean(z4)
cov(z4)
