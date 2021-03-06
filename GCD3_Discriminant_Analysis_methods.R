# ce projet est r�aliser par une �quipe de ENSA Hoceima (Maroc)
# l'�quipe de projet : Walid Benjehd, Med Benyakoub, Abdallah Qesmoun

# set the work directory 
setwd("C:/Users/WalidBenjehd/Documents/R/project")
# check the work directory 
getwd()

#lire les donn�es complete 1000 lignes
DF.data <-read.csv("R/project/german_credit.csv",header = TRUE, sep=",")
#lire a sample (proportion) des donn�es 98 lignes
View(DF.data)

#si le data Frame est est fix� alors les noms de colonnes peuvent �tre directement appel�s
attach(DF.data)

#Random sample of 50% of row numbers created
indexes = sample(1:nrow(DF.data), size=0.5*nrow(DF.data))
#training data contient les donn�es index� par indexes
train50 <- DF.data[indexes,]
#test data contient le rest
test50 <- DF.data[-indexes,]

#install le package Mass
install.packages(MASS)
library(MASS)

# Linear Discriminant Analysis
ldafit <- lda(Creditability ~ Value.Savings.Stocks + Length.of.current.employment + Duration.of.Credit..month.+ Credit.Amount + Age..years., data = train50)
ldafit
plot(ldafit)
lda.pred <- predict(ldafit, data=Test50)
ldaclass <- lda.pred$class
table(ldaclass, test50$Creditability)

# Quadratic Discriminant Analysis
qdafit <- qda(Creditability ~ Value.Savings.Stocks + Length.of.current.employment + Duration.of.Credit..month.+ Credit.Amount + Age..years., data = train50)
qdafit
qda.pred <- predict(qdafit, data=Test50)
qdaclass <- qda.pred$class
table(qdaclass, test50$Creditability)
