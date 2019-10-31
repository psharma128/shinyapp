shinyUI(
  dashboardPage(
    dashboardHeader(title = "Global Defense"),
    dashboardSidebar(
      
      sidebarMenu(
        menuItem(text = "Facts", tabName = "Facts",icon = icon("home")),
        menuItem(text = "Country Statistics", tabName = "Country_Statistics",icon = icon("globe")),
        menuItem(text = "Findings", tabName = "Findings",icon = icon("concierge-bell")), 
        menuItem(text = "Future Improvements", tabName = "Future_Improvements",icon = icon("suitcase-rolling")),
        menuItem(text = "Sources", tabName = "Sources",icon = icon("smile")),
        menuItem(text = "About Me", tabName = "About_Me",icon = icon("user"))
      )
    ),
    dashboardBody(
      tabItems(
        tabItem(
          tabName = "Facts",
          h2("Facts about global military spending:"),
          br(),
          h4("-In 2018, the whole world collectively spent almost $1.8 trillion US Dollars on defense expenditures."),
          br(),
          h4("-The United States, the world's top military spender, spent more than $670 billion dollars on its defense in 2018,
             which was more than one third of the total global military spending for the year."),
          br(),
          h4("-Global military spending in recent years has been at the highest levels since World War 2"),
          br(),
          h2("Objective:"),
          br(),
          h4("-I wanted to see the correlation between defense spending hikes and drops between rival countries and also how 
             the global military budget can be better utilized for the betterment of humanity.")
        ),
        
        tabItem(
          tabName = "Country_Statistics",
          h2("How do countries stack up against each other?"),
          fluidRow(column(6,selectizeInput('country1', 'First country:', choices=unique(dataset$Name), selected='World')),
                   column(6,selectizeInput('country2', 'Second country:', choices=unique(dataset$Name), selected='United States'))
          ),
          fluidRow(
            plotlyOutput('country_comparison')
          )
        ),
        tabItem(
          tabName = "Findings",
          h2("Some interesting insight on global military spending:"),
          br(),
          fluidRow(
            plotlyOutput("top52018")
          ),
          br(),
          h4("-According to Reuters, just 10 percent of the annual global military budget can help eradicate extreme poverty and hunger considerably."),
          br(),
          h4("-According to www.straitstimes.com, one sixth of the global military budget for one year, $300 billion dollars, can go a long way in combating 
             climate change by planting millions of trees worldwide which would help trap greenhouse gases and convert them into oxygen, buying the earth 
             another 15-20 years to reduce the use of fossil fuels and adopt cleaner technologies."),
          br(),
          h4("-The American Society for Civil Engineers gave the United States a D+ for its infrastructure, which has not seen any major investments 
             since the Second World War.  According to Jacobin Magazine, if the United States cuts its military budget to about $513 billion a year for 10 years 
             (still the highest in the world by a long shot), the country could save and invest $2 trillion dollars in infrastructure upgrades which would create 
             thousands of jobs and create the infrastructure the United States needs for the 21st century."),
          br(),
          h4("-Also according to Jacobin Magazine, cutting the US defense budget by a little over 10 percent yearly from current levels can make all public colleges and universities 
             in the United States tuition free for all US Citizens and permanent residents.  A college degree today is what a high school diploma was a few decades ago 
             in terms of competitiveness in the job market, therefore, there are calls to extend education assistance towards college degrees to the American public to 
             better equip them to compete in the 21st century job market.  A $70-80 billion dollar cut in the $670+ billion dollar defense budget can make 
             tuition free college a reality."),
        ),
        tabItem(
          tabName = "Future_Improvements",
          h2("Improvements to the project:"),
          br(),
          h4("-For future improvements, I would like to look at more studies as to how the global military budget can be used more effectively.  With all the technological 
             advancements made in recent years, even fractions of the monstrous sums of money spent on global defense can be utilized to make lives better for millions of 
             people by eradicating poverty and homelessness, combating climate change, and investing that money into higher education to prepare the future generations to 
             compete in the post modern workplace."),
          br(),
          h4("-I would also like to see how much waste and inefficiency there is in the US and the military budgets of other top spenders and what cutting that 
              waste alone can achieve."),
        ),
        tabItem(
          tabName = "Sources",
          h2("List of sources used:"),
          br(),
          h4("Kaggle Dataset:
             https://www.kaggle.com/nitinsss/military-expenditure-of-countries-19602019"),
          br(),
          h4("World Bank Dataset:
             https://data.worldbank.org/indicator/MS.MIL.XPND.CD?end=2018&start=1960"),
          br(),
          h4("Reuters:
               https://www.reuters.com/article/us-global-military-goals/just-10-percent-of-world-military-spending-could-knock-off-poverty-think-tank-idUSKCN0X12EQ"),
          br(),
          h4("https://www.straitstimes.com/world/want-to-limit-climate-change-two-months-of-global-military-spending-could-buy-the-world-time"),
          br(),
          h4("https://www.cheatsheet.com/culture/states-cities/the-disturbing-ways-we-waste-money-our-military-budget.html/"),
          br(),
          h4("https://www.jacobinmag.com/2018/09/pentagon-budget-spending-war-military"),
        ),
        tabItem(
          tabName = "About_Me",
          h2("A little about me:"),
          br(),
          h4("My name is Pradeep Sharma, and I am currently enrolled in the data science bootcamp at the New York Data Science Academy.  I was a financial services professional 
             for about 8 years before I decided to study data science.  I was always fascinated by coding and data science was in high demand at financial firms, so I felt the 
             combination of both would make the best career choice for me.  After the bootcamp I aim to continue getting better at the wonderful technologies I have been exposed 
             to at the bootcamp and become a good data scientist."),
        )
        
      )
    )
  )
)