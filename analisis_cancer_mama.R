# Análisis simple de pacientes con cáncer de mama
data <- read.csv("data/cancer_mama.csv")
summary(data)
boxplot(data$tumor_size ~ data$diagnosis, main="Tamaño del tumor por diagnóstico")
