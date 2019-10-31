shinyServer(function(input,output, session){
  output$country_comparison <- renderPlotly({
    ggplotly(df %>% 
      filter(Name %in% c(input$country1,input$country2)) %>% 
      ggplot(aes(x=Year, y=Expenditure.In.USD, fill=Name)) + 
      geom_bar(stat='identity', position='dodge'))
  }) 
  output$top52018 = renderPlotly({
    df$X = NULL
    options(scipen = 999)
    top2018 = df %>% filter(Year==2018, Type=="Country") %>%
      top_n(n=5, wt=Expenditure.In.USD) %>%
      arrange(-Expenditure.In.USD)
    top2018 %>% ggplot(aes(x=reorder(Name,-Expenditure.In.USD), y=Expenditure.In.USD, fill=Code)) + geom_col() +
      labs(x="",title = "Top 5 Spenders in 2018")
    
  })
})

