datos <- iris
datos

n<-sample (1:150, 30)
n
entrenamiento <- datos[-n]
entrenamiento
test<-datos[n,]
View(test)
modelo <- naive_bayes(Species ~ . , data=test, laplace = 1)
predict(modelo, test)
predicciones1 <- predict(modelo, test)
predicciones1
tarjeta_predicciones<-cbind(test, predicciones1)
tarjeta_predicciones
ftable(tarjeta_predicciones, row.vars = "predicciones1", col.vars = "Species")
sensitivity(predicciones1, test$Species)
confusionatrix(predicciones1, test$Species)
g1<- ROCR(test$Species ~ as.numeric(predicciones1))
plot(g1 print.auc=TRUE, main="Curva ROC de datos test")

