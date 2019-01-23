
setwd('C:/Users/Shubham Arora/Desktop/WebData_Analytics/Final Project')
d <- read.csv('Combined_9k_Sample.csv')

#d <- d[d$Y != 0.5, ]

head(d)

set.seed(1234) # set a seed so you can replicate your results
library(caret)

# identify records that will be used in the training set. Here we are doing a
# 70/30 train-test split. You might modify this.

inTrain <- createDataPartition(y = d$Y,   # outcome variable
                               p = .70,   # % of training data you want
                               list = F)
# create your partitions
train <- d[inTrain,]  # training data set
test <- d[-inTrain,]  # test data set


ctrl <- trainControl(method="cv",     # cross-validation set approach to use
                     number=3,        # k number of times to do k-fold
                     classProbs = T,  # if you want probabilities
                     summaryFunction = twoClassSummary, # for classification
                     #summaryFunction = defaultSummary,  # for regression
                     allowParallel=T)

mf <- lm(Y ~ ., data=d)
summary(mf)


