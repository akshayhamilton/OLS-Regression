#For usable date sets
install.packages("wooldridge")
library(wooldridge)
library(PerformanceAnalytics)
#For better results display
install.packages("stargazer")
library(stargazer)

View(data)
rm(data)
View(wage1)

linear_regression<- lm(wage1$wage~wage1$educ)
summary(linear_regression)
linear_regression2<- lm (wage~tenure,data = wage1)

#Without using the dollar sign
lm<- lm (wage~educ,data = wage1)
#Nicer reults displayed using stargazer
stargazer(linear_regression, type = "text")
#showing two models at once
stargazer(linear_regression,linear_regression2, type = "text")
#Making an HTML file with the results
stargazer(linear_regression,linear_regression2, type = "html", out = "2Models.html") 

#Regressing on multiple variables at once
multiple_regressions<-lm(wage1$wage~wage1$educ+wage1$tenure+wage1$married+
                                               wage1$female )
stargazer(multiple_regressions,linear_regression2, type = "html", out = "2Models.html")
stargazer(multiple_regressions, type = "text")
