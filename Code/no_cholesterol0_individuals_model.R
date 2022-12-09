Heartnc<-subset(Heart,Heart$Cholesterol!=0 & Heart$RestingBP!=0)
set.seed(4321)
train1<-sample(746,373)
Hearttrain<-Heartnc[train1,]
Hearttest<-Heartnc[-train1,]
#creating the classical decision tree
library(rpart)
set.seed(4321)
classtree<-rpart(HeartDisease ~ ., data=Hearttrain, method="class", parms=list(split="information"))
library(rpart.plot)
show(rpart.plot(classtree))
summary(classtree)
classtree$cptable
plotcp(classtree)
#the tree DOES need to be pruned
#I think  option 4 (3 splits) is good
classtree4.pruned<-prune(classtree, cp=.01436782)
show(rpart.plot(classtree4.pruned))
Heart.predict<-predict(classtree4.pruned,data=Hearttest, type="class" )
Heart.performance<- table(Hearttest$HeartDisease,Heart.predict,dnn=c("Actual", "Predicted") )
Heart.performance
print(classtree)
summary(classtree)
# error rate= 194/373=.5201
