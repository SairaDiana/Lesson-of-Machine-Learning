datos<-iris
View(datos)

#Aplicamos un muestreo aleatorio simple para hacer el entrenamiento de nuestro modelo 
#con el 20% de nuestros datos
muestra<-iris[sample(1:150,30),]
#View(muestra)

#Las siguientes lineas convierten a la variable objetivo en valores booleanos
muestra$setosa<-c(muestra$Species=="setosa")
muestra$versicolor<-c(muestra$Species=="versicolor")
muestra$virginica<-c(muestra$Species=="virginica")

#Con la librería neuralnet se contruye la red neuronal con el algoritmo de retropropagación
modelo=neuralnet(setosa + versicolor + virginica ~ Sepal.Length +
                   Sepal.Width +
                   Petal.Length +
                   Petal.Width, muestra, hidden = 3, 
                 lifesign = "full",
                 algorithm = "rprop+")

#Ahora, se va a construir la gráfica de la red neuronal
plot(modelo, rep = "best")
plot(modelo, rep = "best", intercept = FALSE)

#Ahora se recorre la tabla completa para hacer calculo de as predicciones
prediccion <- compute(modelo, iris[1:4])
prediccion
which.max(prediccion$net.result[1,])
result<-0
for (i in 1:150) {result[i] <- which.max(prediccion$net.result[i,])}
for (i in 1:150) {if (result[i]==1) {result[i] = "setosa"}}
for (i in 1:150) {if (result[i]==2) {result[i] = "versicolor"}}
for (i in 1:150) {if (result[i]==3) {result[i] = "virginica"}}

#Se hace una comparación de las clases reales con las predicciones
comparacion<-datos
comparacion$predicted<-result
comparacion

#Por último se obtiene la matriz de confusion, en la cual los valores de la diagonal son 
#los más importantes, ya que con ellos se pueden calcular la precisión del modelo
(MC <- table(iris$Species, result))



library(xlsx)
write.xlsx(mydata, "C:/mydata.xlsx") 