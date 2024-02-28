library(viridis)
library(arules)
library(TSP)
library(data.table)
library(tcltk)
library(dplyr)
library(devtools)
library(purrr)
library(tidyr)
library(arulesViz)
setwd("D:/CU/Machine_Learning/Project/ARM")
disease_data <- read.transactions("diseases_arm.csv",
                                   rm.duplicates = FALSE, 
                                   format = "basket",  ##if you use "single" also use cols=c(1,2)
                                   sep=",",  ## csv file
                                   cols=1) ## The dataset HAS row numbers
#inspect(disease_data)
FrulesK = arules::apriori(disease_data, parameter = list(support=.4, 
                                                          confidence=.4, minlen=2))
#inspect(FrulesK)
itemFrequencyPlot(disease_data, topN=20, type="absolute")

SortedRulesK <- sort(FrulesK, by="confidence", decreasing=TRUE)
inspect(SortedRulesK[1:10])

(summary(SortedRulesK))
plot(SortedRulesK, method="graph", engine="interactive")
