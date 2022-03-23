#CARS DATASET 

require(neuralnet)
library(neuralnet)
data <- read.csv('D:/Term 3/Deep Learning/Datasets/cars.csv', header=TRUE)
attach(data)
str(data)

scaleddata<-scale(data)
normalize<- function(x){
  return((x-min(x))/(max(x)-min(x)))
}
maxmindata<-as.data.frame(lapply(data,normalize))

trainset<- maxmindata[1:722, ]
testset<- maxmindata[723:963, ]

library(neuralnet)
nn <- neuralnet(sales~age+gender+miles+debt+income, data = trainset, hidden=3, linear.output = FALSE, threshold = 0.01)

plot(nn)

nn_backprop1<- neuralnet(sales~age+gender+miles+debt+income, data=trainset, hidden = 3, algorithm = "backprop", learningrate = 0.0001)
plot(nn_backprop1)

nn6= neuralnet(sales~age+gender+miles+debt+income, data=trainset, hidden = 3, act.fct = "logistic", linear.output = FALSE)
plot(nn6)
