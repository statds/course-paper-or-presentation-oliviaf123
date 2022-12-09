#creating factors of all variables that are some form of binary
Heart$HeartDisease<-factor(Heart$HeartDisease, levels=c(0,1), labels=c("no","yes"))
Heart$Sex<- factor(Heart$Sex,) #female=1 male=2
Heart$ChestPainType<- factor(Heart$ChestPainType, levels=c("TA", "ATA", "NAP","ASY"))
#TA=1, ATA=2,NAP=3, ASY=4
Heart$FastingBS<-factor(Heart$FastingBS, levels=c(0,1), labels=c("Fasting BS<120","Fasting BS>120"))
Heart$RestingECG<- factor(Heart$RestingECG, levels=c("Normal", "ST"), labels=c("Normal","ST"))
Heart$ExerciseAngina<-factor(Heart$ExerciseAngina, levels=c("N","Y"), labels=c("no","yes"))
Heart$ST_Slope<- factor(Heart$ST_Slope, levels=c("Up", "Flat", "Down"), labels=c("Up","Flat","Down"))

#variable exploration
Heartnc<-subset(Heart,Heart$Cholesterol!=0 & Heart$RestingBP!=0)

#sex
counts<- table(Heart$Sex, Heart$HeartDisease)
barplot(counts, main="Heart Disease and Sex", xlab="Heart Disease", ylab="Frequency", col=c("darksalmon","darkseagreen"), legend=rownames(counts))
#age
boxplot(Heart$Age~Heart$HeartDisease, main="Age and Heart Disease",xlab="Heart Disease", ylab="Age",col="cyan4" )
#cholesterol 
boxplot(Heartnc$Cholesterol~Heartnc$HeartDisease, main="Cholesterol and Heart Disease", xlab="Heart Disease", ylab="Serum Cholesterol (mg/dL) ", col="cyan4")
#resting BP
boxplot(Heart$RestingBP~Heart$HeartDisease, main="Resting Blood Pressure and Heart Disease", xlab="Heart Disease", ylab="Resting Blood Pressure (mmHg)", col="cyan4")
#fasting BS need to figure out how to move legend
counts2<- table(Heart$FastingBS, Heart$HeartDisease)
barplot(counts2,main="Fasting Blood Sugar and Heart Disease", xlab="Heart Disease", ylab= "Frequency", col=c("cyan4","darkblue" ),legend=rownames(counts2))
#resting ecg
counts3<- table(Heart$RestingECG,Heart$HeartDisease)
barplot(counts3, main="Resting ECG and Heart Disease",xlab="Heart Disease", ylab= "Frequency", col=c("cyan4","darkblue" ),legend=rownames(counts3) )
#max HR
boxplot(Heart$MaxHR~Heart$HeartDisease, main="Max Heart Rate and Heart Disease", xlab="Heart Disease", ylab="Max Heart Rate in bpm", col="cyan4")
#exercise angina
counts4<-table(Heart$ExerciseAngina, Heart$ HeartDisease)
barplot(counts4, main="Exercise Induced Angina and Heart Disease",xlab="Heart Disease", ylab= "Frequency", col=c("cyan4","darkblue" ),legend=rownames(counts4))
#dont think old slope needs to be visulized because the general idea will be covered in st slope
#st slope
counts5<- table(Heart$ST_Slope, Heart$HeartDisease)
barplot(counts5, main="ST Slope and Heart Disease",xlab="Heart Disease", ylab= "Frequency", col=c("cyan4","darkblue", "brown1" ),legend=rownames(counts5))
