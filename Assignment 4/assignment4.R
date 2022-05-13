### Q1
cor <- matrix(c(1.00, 0.44, 0.41, 0.29, 0.33, 0.25,
                0.44, 1.00, 0.35, 0.35, 0.32, 0.33,
                0.41, 0.35, 1.00, 0.16, 0.19, 0.18,
                0.29, 0.35, 0.16, 1.00, 0.60, 0.47,
                0.33, 0.32, 0.19, 0.60, 1.00, 0.46,
                0.25, 0.33, 0.18, 0.47, 0.46, 1.00),
                nrow=6, ncol=6,
                dimnames = list(c('French', 'English', 'History', 'Arithmetic', 'Algebra', 'Geometry'),
                                c('French', 'English', 'History', 'Arithmetic', 'Algebra', 'Geometry')))

cor

library(psych)

## non-rotated 직교회전 이전
# q1.none <- principal(q1data, nfactors=2, rotate='none')

# Conduct factor analysis using the principal factor method without rotations.
fac.pf1 <- fa(cor, nfactors=2, fm='pa', rotate='none')
fac.pf1

fac.pf1.d1 <- matrix(c(0.59, 0.38, 0.59, 0.24, 0.43, 0.41, 0.71, -0.34, 0.70, -0.28, 0.58, -0.18), nrow=6, ncol=2)
fac.pf1.d1

fac.pf1.d2 <- matrix(c(0.59, 0.38, 0.59, 0.24, 0.43, 0.41, 0.71, -0.34, 0.70, -0.28, 0.58, -0.18), nrow=2, ncol=6)
fac.pf1.d2

fac.pf1.u <- matrix(c(0.51, 0, 0, 0, 0, 0,
                      0, 0.59, 0, 0, 0, 0,
                      0, 0, 0.64, 0, 0, 0,
                      0, 0, 0, 0.37, 0, 0,
                      0, 0, 0, 0, 0.43, 0,
                      0, 0, 0, 0, 0, 0.63),
                    nrow=6, ncol=6)

fac.pf1.u

fac.pf1.qdans <- cor - (fac.pf1.d1 %*% fac.pf1.d2) - fac.pf1.u
fac.pf1.qdans

# plot factor loadings
fa.plot(fac.pf1,xlim=c(-1,1), ylim=c(-1,1),)

## Rotated
## Conduct factor analysis using the principal factor method with the Varimax rotation.
fac.pf2 <- fa(cor, nfactors=2, fm="pa", rotate="varimax")
fac.pf2

fac.pf2.d1 <- matrix(c(0.23, 0.66, 0.32, 0.55, 0.08, 0.59, 0.77, 0.17, 0.72, 0.22, 0.57, 0.22),
                     nrow=6, ncol=2)
fac.pf2.d1

fac.pf2.d2 <- matrix(c(0.23, 0.66, 0.32, 0.55, 0.08, 0.59, 0.77, 0.17, 0.72, 0.22, 0.57, 0.22),
                     nrow=2, ncol=6)
fac.pf2.d2

fac.pf2.qdans <- cor - (fac.pf2.d1 %*% fac.pf2.d2) - fac.pf1.u
fac.pf2.qdans

# plot factor loadings
fa.plot(fac.pf2,xlim=c(-1,1), ylim=c(-1,1),)

# Conduct factor analysis using the maximum likelihood method without rotations.
fac.ml1 = fa(cor, nfactors=2, n.obs=556, fm="ml", rotate="none")
fac.ml1

# Conduct factor analysis using the maximum likelihood method with the Varimax rotation.
fac.ml2 = fa(cor, nfactors=2, n.obs=556, fm="ml", rotate="varimax")
fac.ml2

### Q2
q2data <- matrix(c(1, 1/3, 1/3,
                   1/3, 1, 1/10,
                   1/3, 1/10, 1),
                 nrow=3, ncol=3)

q2data

fac.q2 <- fa(q2data, nfactors=1, fm='pa', rotate='none')
fac.q2

# Bartlett의 구형성 검정
cortest.bartlett(q2data, n=nrow(q2data))

cortest.bartlett(q2data, n=3)

### Q3
q3data <- matrix(c(0.789, -0.403,
                   0.834, -0.234,
                   0.740, -0.134,
                   0.586, -0.185,
                   0.676, -0.248,
                   0.654, 0.440,
                   0.641, 0.534,
                   0.629, 0.651,
                   0.564, 0.354,
                   0.808, 0.714),
                 nrow=10, ncol=2)

# plot factor loadings
fa.plot(q3data,xlim=c(-1,1), ylim=c(-1,1),)


# Conduct factor analysis using the maximum likelihood method with the Varimax rotation.
fac.ml2 = fa(q3data, nfactors=2, n.obs=20, fm="ml", rotate="varimax")
fac.ml2

### Q4
q4data <- read.table('C:/Users/jason/바탕 화면/고려대 통계학과/2022년 1학기/다변량/과제/assignment4/pollution.dat', header=TRUE, stringsAsFactors=FALSE)
q4data

# Conduct factor analysis using the maximum likelihood method without rotations.
fac.q4.1 = fa(q4data, nfactors=2, n.obs=42, fm="ml", rotate="none")
fac.q4.1

# Conduct factor analysis using the maximum likelihood method without rotations.
fac.q4.1.3 = fa(q4data, nfactors=3, n.obs=42, fm="ml", rotate="none")
fac.q4.1.3


# Conduct factor analysis using the maximum likelihood method with the Varimax rotation.
fac.q4.2 = fa(q4data, nfactors=2, n.obs=42, fm="ml", rotate="varimax")
fac.q4.2

### ㅅㅅ + U
# q4a
fac.pf1.d1 <- matrix(c(-0.17, -0.25,
                       0.04, 0.32,
                       0.78, 0.42,
                       0.70, -0.13,
                       0.60, 0.17,
                       -0.01, 1.00,
                       0.25, 0.16), 
                     nrow=7, ncol=2)
fac.pf1.d1

fac.pf1.d2 <- matrix(c(-0.17, -0.25,
                       0.04, 0.32,
                       0.78, 0.42,
                       0.70, -0.13,
                       0.60, 0.17,
                       -0.01, 1.00,
                       0.25, 0.16), 
                     nrow=2, ncol=7)
fac.pf1.d2

fac.pf1.u <- matrix(c(0.907, 0, 0, 0, 0, 0, 0,
                      0, 0.895, 0, 0, 0, 0, 0,
                      0, 0, 0.213, 0, 0, 0, 0,
                      0, 0, 0, 0.498, 0, 0, 0,
                      0, 0, 0, 0, 0.614, 0, 0,
                      0, 0, 0, 0, 0, 0.005, 0,
                      0, 0, 0, 0, 0, 0, 0.915),
                    nrow=7, ncol=7)

fac.pf1.u

fac.pf2.qdans <- (fac.pf1.d1 %*% fac.pf1.d2) + fac.pf1.u
fac.pf2.qdans

# q4b
fac.pf1.d1 <- matrix(c(-0.26, -0.13, -0.28,
                       0.06, 0.32, 0.04,
                       0.70, 0.27, 0.19,
                       0.76, -0.43, 0.47,
                       0.83, 0.25, -0.49,
                       0.13, 0.92, 0.35,
                       0.44, 0.14, -0.09), 
                     nrow=7, ncol=3)
fac.pf1.d1

fac.pf1.d2 <- matrix(c(-0.26, -0.13, -0.28,
                       0.06, 0.32, 0.04,
                       0.70, 0.27, 0.19,
                       0.76, -0.43, 0.47,
                       0.83, 0.25, -0.49,
                       0.13, 0.92, 0.35,
                       0.44, 0.14, -0.09), 
                     nrow=3, ncol=7)
fac.pf1.d2


fac.pf1.u <- matrix(c(0.840, 0, 0, 0, 0, 0, 0,
                      0, 0.890, 0, 0, 0, 0, 0,
                      0, 0, 0.405, 0, 0, 0, 0,
                      0, 0, 0, 0.005, 0, 0, 0,
                      0, 0, 0, 0, 0.005, 0, 0,
                      0, 0, 0, 0, 0, 0.005, 0,
                      0, 0, 0, 0, 0, 0, 0.778),
                    nrow=7, ncol=7)

fac.pf1.u

fac.pf2.qdans <- (fac.pf1.d1 %*% fac.pf1.d2) + fac.pf1.u
fac.pf2.qdans

fac.q4.1$scores


# Conduct factor analysis using the maximum likelihood method with rotations.
fac.q4.1 = fa(q4data, nfactors=2, n.obs=42, fm="ml", rotate="varimax")
fac.q4.1

# Conduct factor analysis using the maximum likelihood method with rotations.
fac.q4.1.3 = fa(q4data, nfactors=3, n.obs=42, fm="ml", rotate="varimax")
fac.q4.1.3

### q4 final
q4final <- matrix(c(1.85, 1.31, 0.93),
                  nrow=1, ncol=3)
q4final
q4final$scores

fac.q4.1$Structure

fac.q4.1$scores

fac.q4.1

fac.q4.2$scores
