# Análisis simple de pacientes con hipertensión
data <- read.csv("data/hipertension.csv")
summary(data)
hist(data$presion_sistolica, main="Histograma de presión sistólica", xlab="Presión sistólica")
