#retry with no chest pain type or ST slope
set.seed(4321)
train<-sample(918,459)
Htrain<-Heart[train,]
Htest<-Heart[-train,]
#above is redundant code and same as the all variables and all individuals model
library(rpart)
set.seed(4321)
ctree2<-rpart(HeartDisease ~ Age+Sex+RestingBP+Cholesterol+FastingBS+RestingECG+MaxHR+ExerciseAngina+Oldpeak, data=Htrain, method="class", parms=list(split="information"))
library(rpart.plot)
show(rpart.plot(ctree2))
summary(ctree2)
ctree2$cptable
plotcp(ctree2)
h2.predict<-predict(ctree2, data=Htest,type="class")
h2.performance<- table(Htest$HeartDisease,h2.predict,dnn=c("Actual", "Predicted") )
h2.performance
ctree2.pruned<-prune(ctree2,cp=0.02941176)
show(rpart.plot(ctree2.pruned))
h3.predict<-predict(ctree2.pruned, data=Htest,type="class")
h3.performance<- table(Htest$HeartDisease,h3.predict,dnn=c("Actual", "Predicted") )
h3.performance
#error rate= 226/459=.4924
