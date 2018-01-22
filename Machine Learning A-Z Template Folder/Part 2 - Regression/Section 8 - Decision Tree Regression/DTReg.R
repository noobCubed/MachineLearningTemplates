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

#Fitting Decision Tree Regression Model to the dataset
#install.packages('rpart')
library(rpart)
regressor = rpart(formula = Salary ~ .,
                  data = dataset,
                  control = rpart.control(minsplit = 1))


#Predicting a new result 
y_pred = predict(regressor, data.frame(Level = 6.5))

#Visualising the Decision Tree Regression Model results
library(ggplot2)
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary), color = 'red') + 
  geom_line(aes(x = dataset$Level, y = predict(regressor, newdata = dataset)), color = 'blue') +
  ggtitle('Truth or Bluff (Decision Tree Regression)') + 
  xlab('Level') + 
  ylab('Salary')

#Visualising the Decision Tree Regression Model results (For higher resolution and smoother curve)
library(ggplot2)
X_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
x_grid = X_grid
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary), color = 'red') + 
  geom_line(aes(x = X_grid, y = predict(regressor, newdata = data.frame(Level = X_grid))), color = 'blue') +
  ggtitle('Truth or Bluff (Decision Tree Regression)') + 
  xlab('Level') + 
  ylab('Salary')