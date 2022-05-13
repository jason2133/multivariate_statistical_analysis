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
