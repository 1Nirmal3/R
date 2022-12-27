#question 1(a)

a <- 1:20
print(a)

#question 1(b)

b <- rev(a)
print(b)

#question 1(c)

c <- c(a,b)
print(c)

#question 1(d)

tmp <- c(4, 6, 3)
tmp

#question 1(e)

e <- rep(tmp,times = 10)
e

#question 1(f)

f <- rep(tmp,length=31)
f

#question 1(g)

g <- rep(tmp, times=c(11, 10, 10))
g


#question 2

x <- seq(3, 6, by = 0.1)
x
print (exp(x)*cos(x))

#question 3(a)
a2 = (0.1^seq(3,36,by=3))*(0.2^seq(1,34,by=3))
print(a2)

#question 3(b)
a3 = (2^(1:25))/(1:25)
print(a3)

#question 4(a)
sum = 0
for (i in 10:100){
  sum = sum + i^3 + 4*i^2
}
print(sum)

#question 4(b)
sum = 0
for (i in 1:25){
  sum = sum + 2^i/i + 3^i/2^i
}
print(sum)

#question 5(a)

vec1 <- c(paste(c("label"),1:30,sep = ' '))
print(vec1)

#question 5(b)

vec2 <- c(paste(c("fn"),1:30, sep = ''))
print(vec2)

#question 6
set.seed(50)
xVec<- sample(0:999, 250, replace = T)
yVec <- sample (0:999, 250, replace = T)

#question 6(a)
new_vec2 = yVec[-1]-xVec[-length(xVec)]

#question 6(b)
new_vec3 = sin(yVec[-length(xVec)]) / cos(xVec[-1])
new_vec3

#question 6(c)
xVec[-c(249,250)] + 2 * xVec[-c(1,250)]-xVec[-c(1,2)]

#question 6(d)
sum(exp(-xVec[-1])/(xVec[-length(xVec)]+10))

#question 7(a)
yVec[yVec>600]

#question 7(b)
(1:length(yVec))[yVec>600]

#question 7(c)
xVec[yVec>600]

#question 7(d)
sqrt(abs(xVec-mean(xVec)))

#question 7(e)
sum(yVec>max(yVec)-200)

#question 7(f)
sum(xVec%%2==0)

#question 7(g)
xVec[order(yVec)]

#question 7(h)
yVec[c(T,F,F)]

#question 8
1+sum(cumprod(seq(2,38,b=2)/seq (3,39,b=2)))

#question 9

add <- function(x, y) {
  return(x + y)
}
subtract <- function(x, y) {
  return(x - y)
}
multiply <- function(x, y) {
  return(x * y)
}

divide <- function(x, y) {
  return(x / y)
}

print("******Simple R Calculator - Select operation:")
print("1.Add")
print("2.Subtract")
print("3.Multiply")
print("4.Divide")
choice = as.integer(readline(prompt="Enter choice[1/2/3/4]: "))
num1 = as.integer(readline(prompt="Enter first number: "))
num2 = as.integer(readline(prompt="Enter second number: "))


if (choice == 1){
  add(num1, num2)
} else {
  if (choice == 2){
    subtract(num1, num2)
  } else {
    if (choice == 3 ){
      multiply(num1, num2)
    } else {
      if (choice == 4){
        divide(num1, num2)
      } else {
        print("enter numbers correctly")
      }
    }
  }
}