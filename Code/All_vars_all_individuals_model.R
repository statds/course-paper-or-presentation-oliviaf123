#creating the test and training sets
set.seed(4321)
train<-sample(918,459)
Htrain<-Heart[train,]
Htest<-Heart[-train,]
#creating classical decision tree (DTreeAllVars)
library(rpart)
set.seed(4321)
ctree<-classtree<-rpart(HeartDisease ~ ., data=Htrain, method="class", parms=list(split="information"))
library(rpart.plot)
show(rpart.plot(ctree))
summary(ctree)
ctree$cptable
plotcp(ctree)
h.predict<-predict(ctree, data=Htest,type="class")
h.performance<- table(Htest$HeartDisease,h.predict,dnn=c("Actual", "Predicted") )
h.performance
#the tree doesn't need to be pruned
#error rate of 228/459=.496732 - note this fraction is number wrong/ total
