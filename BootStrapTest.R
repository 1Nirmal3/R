data <- read.csv("C:/Users/nirma/Documents/MarriedStats.csv")
names(data)
table(data$Gender)

boxplot(data$Age~data$Gender, las=1, ylab= "Age", xlab="Gender", main="Marriage Age by Gender")

mean(data$Age[data$Gender=="Female"])
mean(data$Age[data$Gender=="Male"])

#Absolute difference in Mean of Ages 
teststats1 <- abs(diff(with(data,tapply(Age, Gender, mean))))
teststats2 <- abs(diff(with(data,tapply(Age,Gender, median))))


t.test(data$Age~data$Gender, paired=F, var.eq=F)

ks.test(data$Age[data$Gender=="Male"],data$Age[data$Gender=="Female"], paired = F)

wilcox.test(data$Age~data$Gender,paired=F)


set.seed(10101)
n <-length(data$Gender)
B <- 10000   
variable <- data$Gender

BootstrapSamples <- matrix(sample(variable,size=n*B, replace=TRUE), nrow=n,ncol=B)
dim(BootstrapSamples)

Boot.test.stat1 <- rep(0,B)
Boot.test.stat2 <- rep(0,B)

for (i in 1:B) {
  #calculate the boot-test-stat1 and save it
  Boot.test.stat1[i] <- abs(mean(BootstrapSamples[1:12,i]) - 
                              mean(BootstrapSamples[13:23,i]))
  #calculate the boot-test-stat2 and save it
  Boot.test.stat2[i] <- abs(median(BootstrapSamples[1:12,i]) - 
                              median(BootstrapSamples[13:23,i])) }

test.stat1;test.stat2
  
round(Boot.test.stat1[1:20],1)
round(Boot.test.stat2[1:20],1)
  

(Boot.test.stat1 >=test.stat1)[1:20]
  
mean(Boot.test.stat1 >=test.stat1)

mean(Boot.test.stat2 >= test.stat2)
table(data$Gender)
  
plot(density(Boot.test.stat1),
     xlab=expression(group("|", bar(Yc)-bar(Ym),"|")))
  
  

