#Hypothesis Testing and Type Two Error

mu=10000
n=30
var=120
xbar=9900

z=(xbar-mu)/(var/sqrt(n))
z

alpha=0.05
z.alpha = qnorm(1-alpha)
z.alpha

-z.alpha > z

#we are rejecting the null hypothesis 


#two-tailed p value
pval=pnorm(z)
pval

#upper-tail

#mu <= mu0 + known variance
z
z.alpha
z.alpha>z

#we are rejecting the null hypothesis

#two-tail test
#Ho: mu=mu0

Z=(xbar-mu)/(var/sqrt(n))
z.half.alpha=qnorm(1-alpha/2)
c(-z.half.alpha,z.half.alpha)

#reject or accept
pval=2*pnorm(Z)
pval


#In the case of two-tailed case taking the same hypothesis , we do not have enough evidence to reject the null hypothesis
#---------------------------------------------

#lower tail under unknown variance

#mu >= mu0 ; mu <=mu0 ; mu=mu0

xbar=9900
mu=10000
var=120
n=30

t=(xbar-mu)/(var/sqrt(n))
t

t.alpha <- qt(1-alpha,df=n-1)
-t.alpha

-t.alpha > t

#upper tail
t.alpha > t


#partial f-test
#-model-building
#-select variable to help decide if variable or term can be removed from a model without making the model significantly worse.


#Also - when if i add a variable or a term that makes my model significantly better 

#- Compute Nested Models

LungCapData <- read.csv(file="C:/Users/nirma/Downloads/lungcapdata.csv")
attach(LungCapData)
names(LungCapData)

#-reduced model
#check whether the reduced model will result in increase in error and decrease in prediciton of the model
#to check if the full model is better or the reduced one 

Full.model <- lm(LungCap ~ Age +I(Age^2))
Reduced.model <- lm(LungCap ~ Age)

summary(Full.model)
summary(Reduced.model)

#partial f test
anova(Reduced.model,Full.model)

model1 <- lm(LungCap~ Age + Height + Smoke + Gender)
model2 <- lm(LungCap~Age+ Smoke+ Gender)

anova(model1,model2)

model3 <- lm(LungCap~ Age + Height + Smoke + Gender)
model4 <- lm(LungCap~Age+ Smoke+ Height)
anova(model3,model4)



