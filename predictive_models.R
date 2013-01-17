#########################################################################
# Author: Kurt Roots
# Company: CogCubed
# Description: Typical predictive models
#
# Package: See below
# Requires: 
#########################################################################


#####################
## RandomForest
## http://cran.r-project.org/web/packages/randomForest/index.html

# Load library
library(randomForest)

# Load data
RDATA <- read.csv("file.csv",header=FALSE,sep=",");

# Create training set, even though we shuold be using cross-validation
ind <- sample(2, nrow(RDATA), replace = TRUE, prob=c(0.8, 0.2))

# Fit training set, with response var V18
fit.rf <- randomForest(V18 ~ .,  data=RDATA[ind == 1,], mTry=4, importance = TRUE, do.trace= 100, proximity=TRUE)

# Fit model based on training
fit.pred <- predict(fit.rf, RDATA[ind == 2,])

# Observe fitted results in a table
table(observed = RDATA[ind==2, "V18"], predicted = fit.pred)

# View results
print(fit) 

# Importance of each predictor
importance(fit.rf) 

######################
## Logistic Regression
## http://www.ats.ucla.edu/stat/r/dae/logit.htm 

# Load library
library(aod)
library(ggplot2)

# Load data
RDATA <- read.csv("file.csv",header=FALSE,sep=",");

# Fit logit
mylogit<- glm(V18~V1+as.factor(V2)+V3+V4+V5+V6+V7+V8+V9+V10+V11+V12+V13+V14+V15+V16+V17, data = RDATA, family=binomial(link="logit"), na.action=na.pass)

# Summary results
summary(mylogit)

# CIs using profiled log-likelihood
confint(mylogit)

# Odds ratios
exp(coef(summary(mylogit)))

# ANOVA
anova(mylogit, test="Chisq")

######################
## Naive Bayes
## http://www.ats.ucla.edu/stat/r/dae/logit.htm 

# Load library
library(e1071)

# Load data
RDATA <- read.csv("file.csv",header=FALSE,sep=",");

# Create training set
ind <- sample(2, nrow(RDATA), replace = TRUE, prob=c(0.8, 0.2))

# Train model
model <- naiveBayes(V18 ~ ., data=RDATA[ind == 1,])

# Fit model
pred <- predict(model, RDATA[ind == 2,])

# Show results
table(pred, RDATA[ind == 2, "V18"])