# Cargar paquetes necesarios
library(dplyr)
library(ggplot2)
library(survival)
library(survminer)

# Leer los datos
data <- read.csv("data/diabetes_data.csv")

# Ver estructura de datos
str(data)

# Modelo de regresión de Cox
modelo_cox <- coxph(Surv(tiempo, evento) ~ edad + glucosa + imc, data = data)
summary(modelo_cox)

# Guardar resultados
sink("resultados/tabla_resultados.txt")
print(summary(modelo_cox))
sink()

# Gráfico de supervivencia según grupo de glucosa
data$grupo_glucosa <- ifelse(data$glucosa > 140, "Alta", "Normal")
fit <- survfit(Surv(tiempo, evento) ~ grupo_glucosa, data = data)

# Guardar gráfico
png("resultados/curva_kaplan_meier.png", width = 800, height = 600)
ggsurvplot(fit, data = data, pval = TRUE, conf.int = TRUE)
dev.off()
