x <- 1
print(x)
x
msg <- "Hello"
msg

x <- 5
x
print(x)

x <- 1:20
x
print(x)

y <- c(1, 2, 3, 4, 5)
y
y[-1]
y[-2]
y[-3]
y[-4]
y[-5]

# character
# numeric (Real Numbers)
# Integer
# Complex
# Logical (True, False)

### Data Types - Vectors and Lists
# numeric
x1 <- c(0.5, 0.6)
x1

# Logical
x2 <- c(TRUE, FALSE)
x2

# Logical
x3 <- c(T, F)
x3

# Character
x4 <- c('a', 'b', 'c')
x4

# Integer
x5 <- 9:29
x5

# Complex
x6 <- c(1+0i, 2+4i)
x6

## Vector() function
x7 <- vector('numeric', length=10)
x7

## character
x8 <- c(1.7, 'a')
x8
class(x8)

## numeric
x9 <- c(TRUE, 2)
x9
class(x9)

## character
x10 <- c('a', TRUE)
x10
class(x10)

## Explicit Coercion
x11 <- 0:6
x11
class(x11)
as.numeric(x11)
as.logical(x11)
as.character(x11)

x12 <- c('a', 'b', 'c')
x12
as.numeric(x12)
as.logical(x12)
as.complex(x12)

## Lists
x13 <- list(1, 'a', TRUE, 1+4i)
x13

### R Data Types : Matrices
x14 <- matrix(nrow=2, ncol=3)
x14
dim(x14)
attributes(x14)

x15 <- matrix(1:6, nrow=2, ncol=3)
x15

x16 <- 1:10
x16
dim(x16) <- c(2, 5)
x16

dim(x16) <- c(5, 2)
x16

## cbind-ing and rbind-ing
x17 <- 1:3
x18 <- 10:12
cbind(x17, x18)
rbind(x17, x18)

### Data Types - Factors
# Factors are treated specially by modelling functions like lm() and glm()
x19 <- factor(c('yes', 'yes', 'no', 'yes', 'no'))
x19
table(x19)
unclass(x19)

x20 <- factor(c('yes', 'yes', 'no', 'yes', 'no'), levels=c('yes', 'no'))
x20

### Data Types - Missing Values
# NA : Not Available : 결측값
# NaN : Not a Number : 0/0처럼 수학적으로 정의가 되지 않는 것

x21 <- c(1, 2, NA, 10, 3)
is.na(x21)
is.nan(x21)

x22 <- c(1, 2, NaN, NA, 4)
is.na(x22)
is.nan(x22)

### Data Types - Data Frames
x23 <- data.frame(foo=1:4, bar=c(T, T, F, F))
x23
nrow(x23)
ncol(x23)

### Data Types - Names Attribute
x24 <- 1:3
x24
names(x24)
names(x24) <- c('foo', 'bar', 'norf')
x24
names(x24)

x25 <- list(a=1, b=2, c=3)
x25

x26 <- matrix(1:4, nrow=2, ncol=2)
x26
dimnames(x26) <- list(c('a', 'b'), c('c', 'd'))
x26

###################### Data Types - Summary
### Data Types
# atomic classes : numeric, logical, character, integer, complex
# vectors, lists
# factors
# missing values
# data frames
# names




