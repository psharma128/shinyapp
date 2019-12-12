library(shiny) 
library(shinydashboard)
library(dplyr) 
library(ggplot2)
library(rsconnect)
library(plotly)
library(reshape)
library(scales)


dataset <- read.csv(file = "./Military_Expenditure_clean.csv")