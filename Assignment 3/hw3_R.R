# Q2
s <- c(3266, 1344, 732, 1176, 163, 238, 1344, 722, 324, 537, 80, 118, 732, 324, 179, 281, 39, 57, 1176, 537, 281, 475, 64, 95, 163, 80, 39, 64, 10, 14, 238, 118, 57, 95, 14, 21)
s

dim(s) <- c(6, 6)
s

x <- c(95.5, 164.4, 55.7, 93.4, 18.0, 31.1)
x
dim(x) <- c(6, 1)
x

s

### a
pca1 = prcomp(s)
pca1$rotation
pca1$sdev^2
summary(pca1)

a <- (1.760684e+06) + (3.515357e+03) + (1.700981e+02) + (1.065424e+01) + (4.267569e-02) + (1.586127e-28)
a
1.760684e+06 / a

### b
pca2 = prcomp(s, center=T, scale=T)
pca2$rotation
pca2$sdev^2
summary(pca2)

### c
# I will recommend b
# the difference of the data unit

# Q3
### a
stock = read.table('C:/Users/jason/¹ÙÅÁ È­¸é/coding1/multivariate_data_analysis/Assignment 3/stock.dat')
stock

# cor_stock <- cor(stock)
# cor_stock

# pca_cor_stock2 <- prcomp(cor_stock)
# pca_cor_stock2

pca_cor_stock <- prcomp(stock, center=T, scale=T)
pca_cor_stock

pca_cor_stock$rotation
pca_cor_stock$sdev^2
summary(pca_cor_stock)

### b
# scree plot
screeplot(pca_cor_stock, type='l')

# I will recommend 2

### c
### lambda 1 = 2.43
# Y1 = -0.469*X1 - 0.532*X2 - 0.465*X3 - 0.387*X4 - 0.360*X5
# Y2 = 0.368*X1 + 0.236*X2 + 0.315*X3 - 0.585*X4 - 0.605*X5

### d
# Yes. 5 to 2 dimensions

# Q4
### a
radiotherapy = read.table('C:/Users/jason/¹ÙÅÁ È­¸é/coding1/multivariate_data_analysis/Assignment 3/radiotherapy.dat', header=TRUE)
radiotherapy

# Using the sample correlation matrix R
pca_radiotherapy <- prcomp(radiotherapy, center=T, scale=T)
pca_radiotherapy$rotation
pca_radiotherapy$sdev^2
summary(pca_radiotherapy)

### b
# 2.437, 1.407, 0.5, 0.4, 0.255

### c
c1 <- (2.437 / 5) * 100
c1

c2 <- (1.407 / 5) * 100
c2

c1 + c2
# we can describe 76.88% of the data using 2 principal components instead of full 5 components.

### d
radio_d <- radiotherapy[1:5]
radio_d
apply(radio_d, 1, sum)

pca_radiotherapy_score <- cbind(radiotherapy, pca_radiotherapy$x[,1:2])
print(pca_radiotherapy_score)
print(pca_radiotherapy_score['PC1'])
print(apply(radio_d, 1, sum))

### e
# screeplot(pca_radiotherapy, type='l')
# Using the derived two principal components, produce a scatterplot of this data set. Discuss your findings. 
# plot(pca_radiotherapy$x[,1], pca_radiotherapy$x[,2], xlab="PC1",ylab="PC2",type="n",lwd=2)

pca_radiotherapy_score <- cbind(radiotherapy, pca_radiotherapy$x[,1:2])
print(pca_radiotherapy_score)

plot(pca_radiotherapy_score[c("PC1", "PC2")], xlim=c(-4, 4), ylim=c(-4, 4))
abline(h=0, v=0)

# Y1 = -0.469*X1 - 0.532*X2 - 0.465*X3 - 0.387*X4 - 0.360*X5
# Y2 = 
