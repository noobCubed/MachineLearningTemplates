# Regression Template

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
# library(caTools)
# set.seed(123)
# split = sample.split(dataset$DependentVariable, SplitRatio = 0.8)
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)


#Fitting Regression Model to the dataset
#Create Regressor here


#Predicting a new result 
y_pred = predict(regressor, data.frame(Level = 6.5))

#Visualising the Regression Model results
library(ggplot2)
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary), color = 'red') + 
  geom_line(aes(x = dataset$Level, y = predict(regressor, newdata = dataset)), color = 'blue') +
  ggtitle('Truth or Bluff (Linear Regression)') + 
  xlab('Level') + 
  ylab('Salary')

#Visualising the Regression Model results (For higher resolution and smoother curve)
library(ggplot2)
X_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
x_grid = X_grid
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary), color = 'red') + 
  geom_line(aes(x = X_grid, y = predict(regressor, newdata = data.frame(Level = X_grid))), color = 'blue') +
  ggtitle('Truth or Bluff (Linear Regression)') + 
  xlab('Level') + 
  ylab('Salary')