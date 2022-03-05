### Student
student <- read.csv('C:/Users/jason/바탕 화면/coding1/multivariate_data_analysis/book_problem/data/student.csv', header=TRUE)
student

### 공분산행렬과 상관행렬의 계산
# 첫번째 변수 ID 제거
student.X <- student[-1]
student.X

# 요약 통계량
summary(student.X)

# 공분산 행렬
cov(student.X)

# 상관 행렬
cor(student.X)

# 중심화
student.C <- scale(student.X, center=TRUE, scale=FALSE)
print(student.C)

# 표준화
student.Z <- scale(student.X, center=TRUE, scale=TRUE)
print(student.Z)

# 표준화 -> 공분산 행렬 구하는 것과
# 원래 자료에서 상관 행렬 구하는 것은 서로 같은 것을 의미한다.
cov(student.Z)
cor(student.X)

### 그래프적 표현을 위한 R 프로그램
# 산점도
plot(x2~x1, data=student, pch='*', cex=2, col='blue')
plot(student$x1, student$x2, pch=8, cex=2, col='blue')

# 연결선 그래프
student.ox1 <- student[order(student$x1),]
plot(x2~x1, data=student.ox1, cex=2, col='red', type='o', lty=5, lwd=2)

# 한 화면에 여러 개의 그래프를 표현하기
par(mfrow=c(1, 2))
plot(x4~x3, data=student, pch=20, cex=2, xlim=c(0, 100), ylim=c(0, 100))
plot(x4~x5, data=student, pch=20, cex=2, xlim=c(0, 100), ylim=c(0, 100))

# 산점도 행렬
par(mfrow=c(1, 1))
plot(student.X, pch=20, cex=2, xlim=c(0, 100), ylim=c(0, 100))
pairs(student.X, cex=2, xlim=c(0, 100), ylim=c(0, 100), cex.labels=1.2)

# 별도표
stars(student.X, full=TRUE, scale=TRUE, radius=TRUE, draw.segments=TRUE,
      frame.plot=TRUE, labels=rownames(student.X), nrow=3, ncol=5,
      cex=0.8, len=0.8, lwd=1, axes=TRUE, ylim=c(1, 8), key.loc=c(7,2))

# 레이더 도표
# install.packages('plotrix')
library(plotrix)
radial.plot(student.X, rp.type='p', radial.lim=c(0, 100),
            lwd=2, lty=1, labels=names(student.X),
            show.grid=TRUE, show.radial.grid=TRUE, show.grid.labels=1)

# 개체별 레이더도표
par(mfrow=c(2, 5))

for (i in 1:nrow(student.X)) {
  radial.plot(student.X[i,], rp.type='rp', radial.lim=c(0, 100),
              lty=1, lwd=2, labels=names(student.X),
              show.grid=TRUE, show.radial.grid=TRUE, show.grid.labels=F,
              rad.col='gray', line.col='red', grid.col='gray',
              main=rownames(student.X)[i])
}

# 프로파일 도표
library(plotrix)
student.part <- student.X[c(2, 5, 6, 9, 10),]
ladderplot(student.part, scale=FALSE, lty=1, pch=1:5, col=1:5,
           ylim=c(0, 100), vertical=TRUE)
legend('topright', pch=1:5, col=1:5, c('2', '5', '6', '9', '10'))

# 체르노프 얼굴 그림
library(aplpack)
faces(student.X, face.type=0, nrow.plot=2, ncol.plot=5, scale=T, cex=1.5)

