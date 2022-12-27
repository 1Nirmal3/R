df <- read.csv(file="C:/Users/nirma/Downloads/lungcapdata.csv")
attach(df)
names(df)

#Ho : mu<8 + 95% confidence interval
t.test(LungCap, mu = 8,alternative="two.side",conf.level =0.95)

boxplot(LungCap ~ Smoke)

#Ho : Mean of smokers = Mean of Non-Smokers
#assumption - non-equal variances

t.test(LungCap ~ Smoke, mu=0, alt="two.sided", paired=F, conf.level=0.95)

#By default values which t.test takes are mention in the above line
t.test(LungCap ~ Smoke)

t.test(LungCap[Smoke=='no'],LungCap[Smoke=='yes'])
