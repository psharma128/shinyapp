library(reshape)

df = melt(dataset)
df = df[order(df$Name),]
colnames(df) = c('Name', 'Code', 'Type', 'Indicator.Name', 'Year', 'Expenditure.In.USD')
df = df[-4]
df$Year = as.numeric(gsub('X', '', as.character(df$Year)))

write.csv(df, './Military_Expenditure_clean.csv')
