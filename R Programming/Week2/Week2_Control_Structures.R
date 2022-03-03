### Control Structures
# if.else : testing a condition
# for : execute a loop a fixed number of times
# while : execute a loop while a condition is true
# repeat : excute an infinite loop
# break : break the execution of a loop
# next : skip an interation of a loop
# return : exit a function

### If-else

x <- 5
x

if (x > 3) {
  y1 <- 10
} else {
  y1 <- 0
}

y1

y2 <- if(x > 3) {
  10
} else {
  0
}

y2

### for loops
for (i in 1:10) {
  print(i)
}

x2 <- c('a', 'b', 'c', 'd')

for(i in 1:4) {
  print(x2[i])
}

for(i in seq_along(x2)){
  print(x2[i])
}

for(letter in x2){
  print(letter)
}

for(i in 1:4) print(x2[i])

## Nested for loops
x3 <- matrix(1:6, 2, 3)
x3

for(i in seq_len(nrow(x3))) {
  for(j in seq_len(ncol(x3))) {
    print(x3[i, j])
  }
}

### Control Structures - While loops
## While
x4 <- 0
x4

while (x4 < 10) {
  print(x4)
  x4 <- x4 + 1
}

## while
x5 <- 5
x5

# rbinom() 함수 : 이항분포의 난수 발생
# rbinom(n, size, prob)
# rbinom(표본크기, 시행횟수, 사건발생확률)

while (x5 >= 3 && x5 <= 10) {
  print(x5)
  coin <- rbinom(1, 1, 0.5)
  
  if(coin == 1) {
    x5 <- x5 + 1
  } else {
    x5 <- x5 - 1
  }
}

### Control Structures - Repeat, Next, Break
## repeat
x6 <- 1
tol <- 1e-8
x6
tol

# install.packages('sos')
#require('sos')
# findFn('computeEstimate')

repeat {
  x7 <- computeEstimate()
  
  if(abs(x7-x6) < tol) {
    break
  } else {
    x6 <- x7
  }
}

## next, return
for(i in 1:100) {
  if(i <= 20) {
    ## skip the first 20 iterations
    next
  }
  print('Jason Lee')
}

# Control structures like if, while, and for allow you to control the flow of an R program.
# Infinite loops should generally be avoided, even if they are theoretically correct.
# Control structures mentioned here are primarily useful for writing programs; for command-line interactive work, the 'apply functions are more useful.
