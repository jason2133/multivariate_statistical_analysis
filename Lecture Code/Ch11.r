# Section 11.4.1 An Application of Fisher's Discriminant Function;

skull = read.table("c://data//tibetan.dat")

library(MASS)
group=c(rep(1,17), rep(2,15))


# Linear discriminant Function
# Calculate the linear discriminant function
dis1 = lda(skull, group,prior = c(1/2,1/2),CV=F)
dis1$scaling
# Note that the lda function provides the coefficients in a scaled version in which each discriminant function has mean zero and variance one.

# Classify observations using the linear discriminant function
class1 = predict(dis1)$class
class1
# Tabulate the performance of the discriminant function 
tab1 = table(group,class1)
tab1
# Calculate the misclassification rate
1 - sum(tab1[row(tab1)==col(tab1)]*(1/(2*apply(tab1,1,sum))))


# Calculate the linear discriminant function for the leaving-one-out method
dis2 = lda(skull, group,prior = c(1/2,1/2),CV=T)
# Classify observations using the leaving-one-out method
class2 = dis2$class
# Tabulate the performance using the leaving-one-out method  
tab2 = table(group,class2)
tab2
# Calculate the misclassification rate of the leaving-one-out method
1 - sum(tab2[row(tab2)==col(tab2)]*(1/(2*apply(tab2,1,sum))))


# Linear discriminant Function using other prior probabilities 
# Calculate the linear discriminant function
dis3 = lda(skull, group,prior = c(0.2,0.8),CV=F)
# Classify observations using the linear discriminant function
class3 = predict(dis3)$class
class3
# Tabulate the performance of the discriminant function 
tab3 = table(group,class3)
tab3
# Calculate the misclassification rate
1 - sum(tab3[row(tab3)==col(tab3)]*1/apply(tab3,1,sum)*c(0.2,0.8))



# Quadratic discriminant Function
# Calculate the linear discriminant function
dis4 = qda(skull, group,prior = c(1/2,1/2),CV=F)
# Classify observations using the quadratic discriminant function
class4 = predict(dis4)$class
class4
# Tabulate the performance of the discriminant function 
tab4 = table(group,class4)
tab4
# Calculate the misclassification rate
1 - sum(tab4[row(tab4)==col(tab4)]*(1/(2*apply(tab4,1,sum))))


# Calculate the quadratic discriminant function for the leaving-one-out method
dis5 = qda(skull, group,prior = c(1/2,1/2),CV=T)
# Classify observations using the leaving-one-out method
class5 = dis5$class
# Tabulate the performance using the leaving-one-out method 

tab5 = table(group,class5)
tab5
# Calculate the misclassification rate of the leaving-one-out method
1 - sum(tab5[row(tab5)==col(tab5)]*(1/(2*apply(tab5,1,sum))))


#################################################################################

# Sectin 11.8. Logistic Discrimination;

# Read data (cancer.dat) from your directory and attach in R for use.
cancer = read.table("c://data//cancer.dat")
# Put the label of each variable.
colnames(cancer) = c("cid","age","acid","xray","size","grade","involve")

# Logistic discriminant Function
dis = glm(involve ~ age + acid + xray + size + grade, family=binomial(),data=cancer)

# Calculate the allocation rule: xbeta > 0.
dis$linear.predictors

n=nrow(cancer)
group=numeric(n)
for (i in 1:n) {if (dis$linear.predictors[i]>0) group[i] = 1}
group

# Tabulate the performance of the logistic discriminant function 
tab6=table(cancer$involve,group)
tab6

# Calculate the misclassification rate
1 - sum(tab6[row(tab6)==col(tab6)]*(1/(2*apply(tab6,1,sum))))


# Crossvalidation Results
loo_cv = function(data){
   list=1:n
   predc=numeric(n)
   cgroup=numeric(n)
   for (i in 1:n){
      disc=glm(involve ~ age + acid + xray + size + grade, 
                   family=binomial(),data=data, subset=list[-i])
      predc[i] = predict(disc,cancer[i,],type="response")
      if (predc[i]>.5) cgroup[i] = 1}
   output=list(predc=predc,cgroup=cgroup)
   return(output)}
   
cvout=loo_cv(cancer)
cvout$cgroup

# Calculate the misclassification rate of the leaving-one-out method
tab7=table(cancer$involve,cvout$cgroup)
tab7

# Calculate the misclassification rate
1 - sum(tab7[row(tab7)==col(tab7)]*(1/(2*apply(tab7,1,sum))))






