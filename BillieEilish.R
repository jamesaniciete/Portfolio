# read, view, attach, summary
billie <- read.csv("BillieConCorona.csv", header=TRUE)
View(billie)
attach(billie)
summary(billie)
str(billie)

Type_Rank <- as.numeric(Type_Rank)

##############################################################
# w/ face (7 factors)
w_face <- lm(Resale_Price ~ Type_Rank + Days_Until + Day_Rank2 + 
   Interested + Radio_Plays + Face + Corona, billie)
w_face
summary(w_face)

  # VIF
library(car)
library(tidyverse)
library(caret)
library(lattice)
vif(w_face)

  # Fitted Values and Residuals
library(broom)
model.diag.metrics <- augment(w_face)
head(model.diag.metrics)

  # Diagnostic Plots
par(mfrow = c(2, 2))
plot(w_face)

  # Check for Linearity
plot(w_face, 1)
    # explanatory variables plotted against model
par(mfrow = c(3,3))
plot(Type_Rank, residuals(w_face))
plot(Days_Until, residuals(w_face))
plot(Day_Rank2, residuals(w_face))
plot(Interested, residuals(w_face))
plot(Radio_Plays, residuals(w_face))
plot(Face, residuals(w_face))
plot(Corona, residuals(w_face))

  # Check for Independence
# going to plot e_i vs e(i-1)
length(residuals(w_face))
e_i <- residuals(w_face)[2:1299]
e_ilessone <- residuals(w_face)[1:1298]
plot(e_ilessone, e_i, xlab = "e_(i-1)", ylab = "e_i",
     main = "Plot of Residuals")
  # Check for Normally Distributed Errors
# library(ggplyr)
library(ggpubr)
    # Shapiro-Wilkes Test
shapiro.test(residuals(w_face))
    # Plots
par(mfrow=c(1,3))
      # Q-Q Plot
plot(w_face, 2)
hist(residuals(w_face), main = 'Histogram of Residuals')
boxplot(residuals(w_face), main = 'Boxplot of Residuals')
  # Check for Equal Variances 
plot(w_face, 3)

################## Boxcox Transformation Analysis for Y ################
# link: https://rpubs.com/bskc/288328
library(readr)
library(MASS)
library(car)
library(moments)
b <- boxCox(w_face, optimize = TRUE)
  # lambda values
lambda <- b$x
  # log likelihood values for SSE
likelihood <- b$y
  # combine lambda and log likelihood values
bc <- cbind(lambda, likelihood)
  # values are sorted to identify the lambda value for the maximum
  # log likelihood for obtaining minimum SSE
sorted_bc <- bc[order(-likelihood), ]
sorted_bc
# the top number is the lambda that'll be used
  # lambda = 10/99
head(sorted_bc, n=10)

###### transform y using convenient lambda = 0 in boxcox transformation ###################
transformed <- lm(log(Resale_Price) ~ Type_Rank + Days_Until + Day_Rank2 + 
                  Interested + Radio_Plays + Face + Corona, billie)
summary(transformed)
vif(transformed)
par(mfrow=c(2,2))
plot(transformed)
shapiro.test(residuals(transformed))

# Linearity Check
plot(transformed,1)

# Check for Independence
  # going to plot e_i vs e(i-1)
length(residuals(transformed))
e_i <- residuals(transformed)[2:1299]
e_ilessone <- residuals(transformed)[1:1298]
plot(e_ilessone, e_i, xlab = "e_(i-1)", ylab = "e_i",
     main = "Plot of Residuals")

# Check for Normally Distributed Errors
# Shaprio-Wilk
shapiro.test(residuals(transformed))
# Plots
par(mfrow=c(1,3))
# Q-Q Plot
plot(transformed, 2)
hist(residuals(transformed), main = 'Histogram of Residuals')
boxplot(residuals(transformed), main = 'Boxplot of Residuals')

# Check for Equal Variances
plot(transformed, 3)

        ###### Transform X's now #################
transformedx <- lm(log(Resale_Price) ~ (Type_Rank)^2 + Days_Until + Day_Rank2 + 
                    Interested + Radio_Plays + Face + Corona, billie)
summary(transformedx)
vif(transformedx)
par(mfrow=c(2,2))
plot(transformedx)
shapiro.test(residuals(transformedx))

# Linearity Check
plot(transformedx,1)

# Check for Independence
# going to plot e_i vs e(i-1)
length(residuals(transformedx))
e_i <- residuals(transformedx)[2:1299]
e_ilessone <- residuals(transformedx)[1:1298]
plot(e_ilessone, e_i, xlab = "e_(i-1)", ylab = "e_i",
     main = "Plot of Residuals")

# Check for Normally Distributed Errors
# Shaprio-Wilk
shapiro.test(residuals(transformedx))
# Plots
par(mfrow=c(1,3))
# Q-Q Plot
plot(transformedx, 2)
hist(residuals(transformedx), main = 'Histogram of Residuals')
boxplot(residuals(transformedx), main = 'Boxplot of Residuals')

# Check for Equal Variances
plot(transformedx, 3)














#log#### transform X's using log transformation ##############
attach(billie)
billie$Type_Rank <- log(Type_Rank)
billie$Days_Until <- log(Days_Until)
billie$Day_Rank2 <- log(Day_Rank2)
billie$Interested <- log(Interested)
billie$Radio_Plays <- log(Radio_Plays)
billie$Face <- log(Face)
billie$Corona <- log(Corona)


  # log transform Type_Rank & Day_Rank2
transformed_xy <- lm(log(Resale_Price) ~ Type_Rank + Days_Until + Day_Rank2 
                     + Interested + Radio_Plays + Face + Corona, billie)
summary(transformed_xy)
vif(transformed_xy)
par(mfrow=c(2,2))
plot(transformed_xy)
shapiro.test(residuals(transformed_xy))

# Linearity Check
plot(transformed_xy,1)

# Check for Independence
# going to plot e_i vs e(i-1)
length(residuals(transformed_xy))
e_i <- residuals(transformed_xy)[2:1299]
e_ilessone <- residuals(transformed_xy)[1:1298]
plot(e_ilessone, e_i, xlab = "e_(i-1)", ylab = "e_i",
     main = "Plot of Residuals")

# Check for Normally Distributed Errors
# Shaprio-Wilk
shapiro.test(residuals(transformed_xy))
# Plots
par(mfrow=c(1,3))
# Q-Q Plot
plot(transformed_xy, 2)
hist(residuals(transformed_xy), main = 'Histogram of Residuals')
boxplot(residuals(transformed_xy), main = 'Boxplot of Residuals')

# Check for Equal Variances
plot(transformed_xy, 3)




#############################################################################3
###### transform y using exact lambda in boxcox transformation #######################
transformed1 <- lm((Resale_Price)^(10/99) ~ Type_Rank + Days_Until + Day_Rank2 + 
                    Interested + Radio_Plays + Face + Corona, billie)
summary(transformed1)
vif(transformed1)
par(mfrow=c(2,2))
plot(transformed1)
shapiro.test(residuals(transformed1))

# Linearity Check
plot(transformed1,1)

# Check for Independence
# going to plot e_i vs e(i-1)
length(residuals(transformed1))
e_i <- residuals(transformed1)[2:1299]
e_ilessone <- residuals(transformed1)[1:1298]
plot(e_ilessone, e_i, xlab = "e_(i-1)", ylab = "e_i",
     main = "Plot of Residuals")

# Check for Normally Distributed Errors
# Shaprio-Wilk
shapiro.test(residuals(transformed1))
# Plots
par(mfrow=c(1,3))
# Q-Q Plot
plot(transformed1, 2)
hist(residuals(transformed1), main = 'Histogram of Residuals')
boxplot(residuals(transformed1), main = 'Boxplot of Residuals')

# Check for Equal Variances
plot(transformed, 3)

################################################################################3
#R###### remove Radio_Plays ####################################
transformed4 <- lm(log(Resale_Price) ~ Type_Rank + Days_Until + Day_Rank2 + 
                    Interested + Face + Corona, billie)
summary(transformed4)
vif(transformed4)
par(mfrow=c(2,2))
plot(transformed4)

# Linearity Check
plot(transformed4,1)

# Check for Independence
# going to plot e_i vs e(i-1)
length(residuals(transformed4))
e_i <- residuals(transformed4)[2:1299]
e_ilessone <- residuals(transformed4)[1:1298]
plot(e_ilessone, e_i, xlab = "e_(i-1)", ylab = "e_i",
     main = "Plot of Residuals")

# Check for Normally Distributed Errors
# Shaprio-Wilk
shapiro.test(residuals(transformed4))
# Plots
par(mfrow=c(1,3))
# Q-Q Plot
plot(transformed4, 2)
hist(residuals(transformed4), main = 'Histogram of Residuals')
boxplot(residuals(transformed4), main = 'Boxplot of Residuals')

# Check for Equal Variances
plot(transformed4, 3)


######################################################################################
###### transform y using exact lambda in boxcox transformation #######################
transformed_y <- (Resale_Price^(10/99)-1)/Resale_Price
transformed1 <- lm(transformed_y ~ Type_Rank + Days_Until + Day_Rank2 + 
                     Interested + Radio_Plays + Face + Corona, billie)
summary(transformed1)
vif(transformed1)
par(mfrow=c(2,2))
plot(transformed1)
shapiro.test(residuals(transformed1))

# Linearity Check
plot(transformed1,1)

# Check for Independence
# going to plot e_i vs e(i-1)
length(residuals(transformed1))
e_i <- residuals(transformed1)[2:1299]
e_ilessone <- residuals(transformed1)[1:1298]
plot(e_ilessone, e_i, xlab = "e_(i-1)", ylab = "e_i",
     main = "Plot of Residuals")

# Check for Normally Distributed Errors
# Shaprio-Wilk
shapiro.test(residuals(transformed1))
# Plots
par(mfrow=c(1,3))
# Q-Q Plot
plot(transformed1, 2)
hist(residuals(transformed1), main = 'Histogram of Residuals')
boxplot(residuals(transformed1), main = 'Boxplot of Residuals')

# Check for Equal Variances
plot(transformed, 3)


###### transform resale price using box-cox power transformation ######################
transformed_via_PowerTransformation <- lm((Resale_Price)^(10/99) ~ Type_Rank + Days_Until + Day_Rank2 + Interested + Radio_Plays + Face + Corona, billie)
summary(transformed_via_PowerTransformation)
shapiro.test(residuals(transformed_via_PowerTransformation))

# VIF
vif(transformed_via_PowerTransformation)

# Diagnostic Plots
par(mfrow = c(2,2))
plot(transformed_via_PowerTransformation)

shapiro.test(residuals(transformed_via_PowerTransformation))
anova


#############################################################
wo_corona <- lm(Resale_Price ~ Type_Rank + Days_Until + Day_Rank2 + 
               Interested + Radio_Plays + Face, billie)
wo_corona
summary(wo_corona)

# VIF
library(car)
library(tidyverse)
library(caret)
library(lattice)
vif(wo_corona)

# Fitted Values and Residuals
library(broom)
model.diag.metrics <- augment(wo_corona)
head(model.diag.metrics)

# Diagnostic Plots
par(mfrow = c(2, 2))
plot(wo_corona)

# Check for Linearity
plot(wo_corona, 1)
# explanatory variables plotted against model
par(mfrow = c(2,3))
plot(Type_Rank, residuals(wo_corona))
plot(Days_Until, residuals(wo_corona))
plot(Day_Rank2, residuals(wo_corona))
plot(Interested, residuals(wo_corona))
plot(Radio_Plays, residuals(wo_corona))
plot(Face, residuals(wo_corona))

# Check for Independence


# Check for Normally Distributed Errors
library(ggplyr)
library(ggpubr)
# Shapiro-Wilkes Test
shapiro.test(residuals(wo_corona))
# Plots
par(mfrow=c(1,3))
# Q-Q Plot
plot(wo_corona, 2)
hist(residuals(wo_corona), main = 'Histogram of Residuals')
boxplot(residuals(wo_corona), main = 'Boxplot of Residuals')



##################################################3

# w/o face (6 factors)
wo_face <- lm(Resale_Price ~ Type_Rank + Days_Until + Day_Rank2 + 
     Interested + Radio_Plays + Corona, billie)
wo_face
summary(wo_face)
  # RSE
sigma(wo_face)/mean(Resale_Price)

# w/o Radio Plays
wo_radio <- lm(Resale_Price ~ Type_Rank + Days_Until + Day_Rank2 + 
   Interested + Face + Corona, billie)
wo_radio
summary(wo_radio)
  # RSE
sigma(wo_radio)/mean(Resale_Price)



