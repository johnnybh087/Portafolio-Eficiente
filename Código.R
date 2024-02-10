#Cálculo de la frontera eficiente Malasia-Singapur

#Paquetes requeridos
library(fBasics)
library(fPortfolio)
library(openxlsx2)
library(PerformanceAnalytics)
library(readxl)
library(timeSeries)

#Ruta de la data
Data_Frontera_eficiente_Proyecto_Malasia_ <- read_excel("PDV/Analisis de Negocio/Proyectos/1. Proyecto Malasia/Data - Frontera eficiente (Proyecto Malasia).xlsx")

#Data
Data <- data.frame(Data_Frontera_eficiente_Proyecto_Malasia_)

#Retornos
Retornos <- na.omit(Return.calculate(Data), type= "Discrete")

#Convirtiendo Retornos en serie de tiempo
RetornosST <- as.timeSeries(Retornos)

#Frontera Eficiente
Frontera_eficiente <- portfolioFrontier(RetornosST, constraints= "LongOnly")

#Gráfico de Frontera Eficiente 
plot(Frontera_eficiente, c(1))

#Pesos de Frontera Eficiente
Pesos_FE <- getWeights(Frontera_eficiente)

#Retornos de Frontera Eficiente
Retornos_FE <- getTargetReturn(Frontera_eficiente)

#Riesgos de Frontera Eficiente
Riesgos_FE <- getTargetRisk(Frontera_eficiente)

#Exportar Pesos a Excel
write_xlsx(Pesos_FE, "Pesos.xlsx")

#Exportar Retornos a Excel
write_xlsx(Retornos_FE, "Retornos.xlsx")

#Exportar Riesgos a Excel
write_xlsx(Riesgos_FE, "Riesgos.xlsx")