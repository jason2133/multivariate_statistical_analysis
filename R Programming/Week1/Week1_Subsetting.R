### Subsetting - Basics
# There are a number of operators that can be used to extract subsets of R objects.

# [ always returns an object of the same class as the original; can be used to select more than one element (there is one exception)
# [[ is used to extract elements of a list or a data frame; it can only be used to extract a single element and the class of the returned object will not necessarily be a list or data frame
# $ is used to extract elements of a list or data frame by name; semantics are similar to hat of [[.

x <- c('a', 'b', 'c', 'c', 'd', 'a')
x
x[1]
x[2]
x[1:4]
x[x > 'a']
u <- x > 'a'
u
x[u]

### Subsetting - Lists
x1 <- list(foo = 1:4, bar=0.6)
x1
x1[1]
x1[[1]]
x1$bar
x1[['bar']]
x1['bar']

x2 <- list(foo=1:4, bar=0.6, baz='hello')
x2[c(1, 3)]

x3 <- list(foo=1:4, bar=0.6, baz='hello')
name <- 'foo'
x3[[name]]
x3$name
x3$foo

x4 <- list(a=list(10, 12, 14), b=c(3.14, 2.81))
x4
x4[[c(1, 3)]]
x4[[c(2, 1)]]

### Subsetting - Matrices
x5 <- matrix(1:6, 2, 3)
x5
x5[1, 2]
x5[2, 1]
x5[1, ]
x5[, 2]

x6 <- matrix(1:6, 2, 3)
x6
x6[1, 2]
x6[1, 2, drop=FALSE]
x6

x7 <- matrix(1:6, 2, 3)
x7[1, ]
x7[1, , drop=FALSE]

### Subsetting - Partial Matching
x8 <- list(aardvark=1:5)
x8
x8&a
x8[['a']]
x8[['a', exact=FALSE]]

### Subsetting - Removing Missing Values
x9 <- c(1, 2, NA, 4, NA, 5)
x9
bad <- is.na(x9)
bad
x9[!bad]
x9[bad]

# Removing NA values
x10 <- c(1, 2, NA, 4, NA, 5)
y <- c('a', 'b', NA, 'd', NA, 'f')
good <- complete.cases(x10, y)
good
x10[good]
y[good]

airquality[1:6, ]
good <- complete.cases(airquality)
airquality[good, ][1:6, ]

### Vectorized Operations
x11 <- 1:4
y2 <- 6:9
x11
y2
x11 + y2
x11 > 2
x11 >= 2
y2 == 8
x11 * y2
x11 / y2

x12 <- matrix(1:4, 2, 2)
y3 <- matrix(rep(10, 4), 2, 2)
x12
y3

x12 * y3
x12 / y3
# 이게 진짜로 Matrix 행렬 곱셈하는거임.
x12 %*% y3


