df <- mtcars
prop.test(df$mpg, p = NULL, alternative = "two.sided",
          correct = TRUE)
library("BSDA")
z.test(
  df$mpg,
  y = NULL,
  alternative = "two.sided",
  mu = 18,
  sigma.x = 1,
  sigma.y = NULL,
  conf.level = 0.95
)
#Therefore we reject our null hypothesis