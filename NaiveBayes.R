filePath <- '~/Downloads/NaiveBayes.csv'
testFilePath <- '~/Downloads/NaiveBayesTest.csv'
outputFilePath <- '~/Downloads/NaiveBayesResults.csv'

#Load e1071 package which contains a Naive Bayes model. The e1071 package was downloaded from https://CRAN.R-project.org/package=e1071. This package sets up the Naive Bayes Model including calculations of probability. 
require('e1071')

train.data$Category.A<-as.logical(data$Category.A)
train.data$Category.B<-as.logical(data$Category.B)
train.data$Category.C<-as.logical(data$Category.C)
category.a.model <-naiveBayes(Category.A ~ Dim.1 + Dim.2 + Dim.3, data=train.data)
category.b.model <-naiveBayes(Category.B ~ Dim.1 + Dim.2 + Dim.3, data=train.data)
category.c.model <-naiveBayes(Category.C ~ Dim.1 + Dim.2 + Dim.3, data=train.data)

test.data$Category.A <- predict(category.a.model, test.data, "raw")[,2]
test.data$Category.B <- predict(category.b.model, test.data, "raw")[,2]
test.data$Category.C <- predict(category.c.model, test.data, "raw")[,2]

write.csv(test.data, outputFilePath)
