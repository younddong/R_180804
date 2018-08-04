
#####################################################
## 문제 1 rJava, DBI, RJDBC, dplyr
## 패키지를 호출하시오
#######################################################
library(rJava)
library(DBI)
library(RJDBC)
library(XML)
library(memoise)
library(KoNLP)
library(wordcloud)
library(dplyr)
library(ggplot2)
library(ggmap)
library(rvest)
library(RColorBrewer)
library(data.table)
library(reshape)
library(stringr)
library(reshape)
library(RColorBrewer)
library(data.table)




vDemo <- c(1:5)
vDemo

# plot(x/y축)
plot(vDemo)

# plot(x축, y축)
plot(1:3, 3:1)

# plot(x축, y축, x축 한계값, y축 한계값)
# lim : 최대 한계값
plot(1:3, 3:1, xlim = c(1,10), ylim = c(1,5))

# x,y 축 제목, 그래프 제목 지정해서 출력
# lab : label 즉, 제목
# main : 제목 
plot(
  1:3, 
  3:1,
  xlim = c(1,10),
  ylim = c(1,5),
  xlab = 'x축값',
  ylab = 'y축값',
  main = 'PLOT 테스트'
)


# 기존 그래프 지우고 새로 그리기
plot.new() 
## dev.new() : 새창에서 띄우기 


## 꺾은 선 차트 
vDemo <- c(100,130,120,150,160)
plot(
  vDemo,  ## 대상 object
  type = 'o',  ## 점과 선을 중첩시킴
  col = 'red',
  ylim = c(0,200),
  axes = F,   ## False = 축을 숨김
  ann = F    ## False = 축의 이름을 정하지 않음
)

axis(
  1,
  at = 1:5,
  lab = c("월", "화", "수", "목", "금")
)

axis(
  2,
  ylim = c(0,200)
)

title(
  main = "과일",
  col.main = "red", # 제목의 글자 색
  font.main = 4   # 글자 크기
)

title(
  xlab = '요일',
  col.lab = "black"
)

title(
  ylab = '가격',
  col.lab = "blue"
)




## 그래프를 배치해서 보여주기
vDemo <- c(100,130,120,150,160)

# mfrow = c(x,y) : 그래프의 배치조정 
# x는 행의 수, y는 열의 수 
par(mfrow = c(1,3))

## 타입정리
# p -> 점 point, default 
# l -> 선 line
# b -> 점,선 
# c -> b에서 점 생략
# o -> 점과 선을 중첩함
# h -> 점에서 x축까지 수직선 그래프 
# s -> 왼쪽값을 기준하여 계단모양으로 연결한 그래프
# n -> 축만 그리고 그래프는 없음
plot(vDemo, type = 'b')
plot(vDemo, type = 'n')
plot(vDemo, type = 'p')


plot.new()
vDemo <- c(100,130,120,150,160)
par(mfrow = c(1,3))
pie(vDemo)
plot(vDemo, type = 'o')
barplot(vDemo)


## mgp = c(제목위치, 지표값위치, 지표선위치)
par(mgp = c(0,1,0))
plot(
  vDemo,
  xlab = "TEST"
)

par(mgp = c(3,1,0))
plot(
  vDemo,
  xlab = "TEST"
)

par(mgp = c(3,2,0))
plot(
  vDemo,
  xlab = "TEST"
)


## oma option 그래프 전체 여백을 조정
par(oma = c(2,1,0,0))
plot(
  vDemo,
  xlab = "TEST"
)

par(oma = c(0,2,0,0))
plot(
  vDemo,
  xlab = "TEST"
)


par(mfrow=c(1,1)) # 1행 1열로 바꿔라
t1 <- c(1,2,3,4)
t2 <- c(5,4,3,2,1)
t3 <- c(3,4,5,6,7)
plot(
  t1,
  type = 's',
  col = 'red',
  ylim = c(1,5)
)

par(new=T) # 중복 허용
plot(
  t2,
  type = 'o',
  col = 'blue',
  ylim = c(1,5)
)

par(new=T) # 중복 허용
plot(
  t3,
  type = 'l',
  col = 'green'
)



## 새로 그려질때마다 x축 제목과 ylim 값이 새롭게 적용
## 따라서, 아래와 같이 lines()를 사용해 보다 쉽게 그리는 방법 권장
plot.new()
par(mfrow=c(1,1)) # 1행1열로 바꿔라
t1 <- c(1,2,3,4)
t2 <- c(5,4,3,2,1)
t3 <- c(3,4,5,6,7)
plot(
  t1,
  type = 's',
  col = 'red',
  ylim = c(1,5)
)
lines(
  t2,
  type = 'o',
  col = 'blue',
  ylim = c(1,5)
)
lines(
  t3,
  type = 'l',
  col = 'green',
  ylim = c(1,5)
)
legend(
  3.5, # x축위치
  5, # y축위치
  c("국","영","수"),
  cex=0.9, # 글자크기
  col = c("red","blue","green"), #컬러
  lty = 1 # 라인타입
)




## 막대 그래프 그리기
## 랜덤값 출력 runif(갯수, 시작값, 끝값)
## 소수점 이하 자리 수 출력 round(숫자, 보고 싶은 소수점 아래 자리수) 
vDemo <- round(runif(5,1,10),0)
vDemo
barplot(vDemo)

##수평방향
barplot(vDemo, horiz = T)





## 그룹으로 묶어서 출력 
v1 <- c(5,4,3,2)
v2 <- c(5,3)
v3 <- c("green", "yellow")
m1 <- matrix(v1,2,2) # 2행 2열의 매트릭스 생성 

barplot(
  m1,
  beside = T,
  names = v2,
  col = v3
)



## 그룹으로 묶어서 가로로 출력 
v1 <- c(5,4,3,2)
v2 <- c("이전", "이후")
v3 <- c("green", "yellow")
v4 <- c(1,0.5, 1,0.5)
m1 <- matrix(v1,2,2) # 2행 2열의 매트릭스 생성 
par(oma = v4) # 그래프여백 6시 9시 12시 3
barplot(
  m1,
  beside = T,
  names = v2,
  col = v3,
  horiz = T
)

## bar에 두개의 값을 합성
plot.new()
v1 <- c(5,4,3,2)
v2 <- c("이전", "이후")
v3 <- c("green", "yellow")
v4 <- c(0, 12)
m1 <- matrix(v1,2,2) # 2행 2열의 매트릭스 생성 
barplot(
  m1,
  xlim = v4,
  names = v2,
  col = v3,
  horiz = T
)



## 과일가격 응용
vBanana <- round(runif(5,100,180), 0)
vCherry <- round(runif(5,100,180), 0)
vOrange <- round(runif(5,100,180), 0)
dFruit <- data.frame(
  바나나 = vBanana,
  체리 = vCherry,
  오렌지 = vOrange
)

vYlim <- c(0,400)
vDay <- c("월","화","수","목","금")
dFruit

barplot(
  as.matrix(dFruit),
  main = "과일판매량",
  beside = T,
  col = rainbow(nrow(dFruit)),
  ylim = vYlim
)

legend(
  16,
  400,
  vDay,
  cex = 0.8,
  fill = rainbow(nrow(dFruit))
)

## 무지개색으로 하되, 개수는 dFrit
## 변수 안에 있는 값의 개수만큼 하라 



## 하나의 바에 값 합치기 

barplot(
  t(dFruit),  # t() 전치함수 - 행과 열의 위치를 전환
  main = "과일판매량",
  col = rainbow(nrow(dFruit)),
  ylim = c(0,600),
  space = 0.1,
  cex.axis = 0.8,   # 축의 글자 크기 
  las = 1,
  names.arg = vDay,
  cex = 0.8
)

legend(
  0,
  600,
  names(dFruit),
  cex = 0.8,
  fill = rainbow(nrow(dFruit))
)


dFruit
t(dFruit)



vPeach <- round(runif(5,0,250), 0)
vPeach
vDay <- c("월","화","수","목","금")
vColor <- c()
vLen <- c(1:length(vPeach))
for(i in vLen){
  if(vPeach[i] >= 200) {
    vColor <- c(vColor, "pink")
  } else if(vPeach[i] >= 100){
    vColor <- c(vColor, "yellow")
  } else {
    vColor <- c(vColor, "skyblue")
  }
}

vPeach
barplot(
  vPeach,
  main = "복숭아 판매량",
  names.arg = vDay,
  col = vColor
  
)



## 키 분포도
## 학급에 총 10명의 학

vHeight1 <- round(runif(2,150,160))
vHeight2 <- round(runif(3,161,170))
vHeight3 <- round(runif(3,171,180))
vHeight4 <- round(runif(2,181,190))
vHeight <- c(
  vHeight1, vHeight2, vHeight3, vHeight4
)
vHeight

## 히스토그램
hist(
  vHeight,
  main = "키 분포도"
)

barplot(
  vHeight,
  main = "키 분포도"
)



## 파이 차트

plot.new()
vPie <- round(runif(5,1,100))
vPie
pie(
  vPie,
  radius = 1,
  init.angle = 90    # 초기값 각도 
)


# 색깔과 라벨명 지정
pie(
  vPie,
  radius = 1,
  init.angle = 90,    # 초기값 각도 
  col = rainbow(length(vPie)),
  label = vDay
)


# 수치값을 출력 
vPct <- round(vPie/sum(vPie)*100,1)
VLab <- paste(vPct, " %")
pie(
  vPie,
  radius = 1,
  init.angle = 90,    # 초기값 각도 
  col = rainbow(length(vPie)),
  label = VLab
)

legend(
  1.1,
  1,
  vDay,
  cex = 0.8,
  fill = rainbow(length(vPie))
)




## 3D 파이 차트 

install.packages("plotrix")
library(plotrix)

plot.new()
vPie <- round(runif(5,1,100))
vDay <- c("월", "화", "수", "목", "금")
vPct <- round(vPie/sum(vPie)*100,1)
vLab <- paste(vPct, " %")

pie3D(
  vPie,
  main = "3D PIE CHART",
  col = rainbow(length(vPie)),
  cex = 0.5,
  labels = vLab,
  explode = 0.05
)

legend(
  0.5,
  1,
  vDay,
  cex = 0.6,
  fill = rainbow(length(vPie))
)






