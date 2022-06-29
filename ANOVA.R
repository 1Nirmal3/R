library(dplyr)

boxplot(mtcars$disp~factor(mtcars$gear),
        xlab = "gear", ylab = "disp")

mtcars_aov <- aov(mtcars$disp~factor(mtcars$gear))
summary(mtcars_aov)
attributes(mtcars_aov)

mtcars_aov$coefficients

TukeyHSD(mtcars_aov)
plot(TukeyHSD(mtcars_aov))
plot(TukeyHSD(mtcars_aov), las=1)

kruskal.test(mtcars$disp~factor(mtcars$gear))
             