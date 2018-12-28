install.packages("ROCR")
library(ROCR)

data1 <- read.csv("Lesson-of-Machine-Learning/DataSets/roc-example-1.csv")
data2 <- read.csv("Lesson-of-Machine-Learning/DataSets/roc-example-2.csv")

pred1 <- prediction(data1$prob, data1$class)
perf1 <- performance(pred1, "tpr", "fpr")
plot(perf1)
lines(par()$usr[1:2], par()$usr[3:4])

prob.cuts.1 <- data.frame(cut = perf1@alpha.values[[1]],
                          fpr = perf1@x.values[[1]],
                          tpr = perf1@y.values[[1]])
head(prob.cuts.1)
pred2 <- prediction(data2$prob, data2$class)