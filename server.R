shinyServer(function(input,output, session){
  output$country_comparison <- renderPlotly({
    if (input$line){
      ggplotly(df %>% 
                 mutate(Expenditure.In.USD = Expenditure.In.USD/1e9) %>%         
                 filter(Name %in% c(input$country1,input$country2)) %>% 
                 ggplot(aes(x=Year, y=Expenditure.In.USD, color=Name, group=Name)) + 
                 geom_line(stat='identity', position='dodge') + 
                 ylab('Expenditure ($)') + 
                 scale_y_continuous(labels = unit_format(unit = "B")) +
                 theme(legend.title = element_blank())
      )
    }else{
      ggplotly(df %>% 
                 mutate(Expenditure.In.USD = Expenditure.In.USD/1e9) %>%         
                 filter(Name %in% c(input$country1,input$country2)) %>% 
                 ggplot(aes(x=Year, y=Expenditure.In.USD, fill=Name)) + 
                 geom_bar(stat='identity', position='dodge') + 
                 ylab('Expenditure ($)') + 
                 scale_y_continuous(labels = unit_format(unit = "B")) +
                 theme(legend.title = element_blank())
      )
    }
    
  }) 
  output$top52018 = renderPlotly({
    df$X = NULL
    options(scipen = 999)
    top2018 = df %>% filter(Year==2018, Type=="Country") %>%
      top_n(n=5, wt=Expenditure.In.USD) %>%
      arrange(-Expenditure.In.USD)
    top2018 %>% 
      mutate(Expenditure.In.USD = Expenditure.In.USD/1e9) %>% 
      ggplot(aes(x=reorder(Name,-Expenditure.In.USD), y=Expenditure.In.USD, fill=Code)) + geom_col() +
      labs(x="",title = "Top 5 Spenders in 2018", y='Expenditure ($)') + 
      theme(plot.title = element_text(hjust = 0.5)) + 
      scale_y_continuous(labels = unit_format(unit = "B")) +
      theme(legend.title = element_blank())
  })
})
