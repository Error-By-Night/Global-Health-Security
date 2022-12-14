library(shiny)
library(shinythemes)
library(plotly)
library(tidyverse)

# define UI
shinyUI(fluidPage(
  theme = shinytheme("darkly"),
  
  # project title
  titlePanel("The Global Health Security: An analysis on GHS Indexes around the World"),
  
  tabsetPanel(
    
    tabPanel("Introduction", fluid = TRUE, sidebarLayout(
      sidebarPanel(
      h3("Background: What is GHS"),
      p("Global health security is the existence of strong and resilient public 
      health systems that can prevent, detect, and respond to infectious disease threats, 
      wherever they occur in the world. Its main goal is to  to minimize the danger and impact 
      of acute public health events that endanger people's health across geographical regions 
      and international boundaries."),
      p("With everything happening in our world today with Covid-19, global health security is 
      extremely important, especially for countries who don't have the money or resources to 
      comabt it. Being perpared for events like this can save millions of lives and benefit all 
      of humanity. When doing this project we wanted to look deeper into this topic so to do so 
      we used the GHS Index which is a data source which assesses countriess health security and 
      capabilies across six categories and 37 indicators."),
      h3("Research Questions"),
      p("-   What countries had the highest GHS Index Scores in both 2019 and 2021?"),
      p("-   What continents had higher GHS Scores?"),
      p("-   How have the index scores of countries changed between 2019 and 2021?"),
      h3("About Us"),
      p("Authors: Aanyk Mann, Joey Kang"),
      p("INFO 201 - University of Washington"),
    ),
    
    mainPanel(
      img(src = "https://www.cdc.gov/globalhealth/healthprotection/fieldupdates/2021/images/Uganda-burial-team-Kagando-Hospital-large.jpg?_=16046g",
          width = "90%", height = "90%"),
    )
    )
  ),
    
  tabPanel("Table for GHS", fluid = TRUE, sidebarLayout(
        sidebarPanel(
          radioButtons(
            "Overall Score",
            label = h3("Select GHS Score"),
            choices = unique(GHS_final$Overall.Score)
          )
        ),
        
        mainPanel(
          tableOutput(outputId = "GHS_final"),
          p(em("This table shows the global health index score of a pool of countries 
              along with the year that the data was gathered. We extracted a random pool 
              of 20 countries to give an example of how drastic the difference of safety 
              can be within countries and even continents. The information displays how in
              countries within Africa there is a much lower index score versus those in 
              Europe or North America.")
          )
        )
      )
    ),
  
  tabPanel("Top Index Scores in 2019", fluid = TRUE, sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "country",
        label = h3("Select Year"),
        choices = c("2019", "2021")
      )
    ),
    
    mainPanel(
      plotlyOutput(outputId = "piechart"),
      p("The piechart shows a diagram of the countries with the highest GHS Index scores in 2019 
        with each country's name written over its respective slice. The piechart here shows a 
        condensed range of numbers, indicating how among the top 10 countries, the discrepensies 
        aren't that drastic. What is intresting is how countries like Thailand and the United Kingdom 
        have similar index scores despite their vastly different GDP levels")
    )
  )
),
  
  tabPanel("Top Index Scores in 2021", fluid = TRUE, sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "country",
        label = h3("Select Year"),
        choices = c("2019", "2021")
      )
    ),
    
    mainPanel(
      plotlyOutput(outputId = "barchart"),
      p("The bargraph shows a visualization of the countires with the top 10 index scores in 2021. 
      Within the top 10 the countires index scores aren't that far apart with the United States 
      having the best score by only 4.8 points from Australia. As seen from the piechart as well,
      the United States has remained on top of the world with their GHS score however it did 
      decline over that 2 year period.")
    )
  )
),
    
  tabPanel("Scatter Plot for GHS", fluid = TRUE, sidebarLayout(
        sidebarPanel(
          selectInput(
            inputId = "country",
            label = h3("Select Country"),
            choices = unique(GHS_row$Country)
          )
        ),
        
        mainPanel(
            plotlyOutput(outputId = "scatterplot"),
          p("The scatterplot shows the dots of selected values in 2019 with each country's name 
        written over the datapoint. The scatterplot here shows a wide range of numbers, 
        indicating the contrasting indexes between countries. There also seems to be many 
        countries clustered around each other as well depending on the continent they are in.")
        )
      )
    ),
    
    tabPanel("Conclusion", fluid = TRUE, sidebarLayout(
      sidebarPanel(
        h3("Conclusion"),
        p("Looking at our analysis and insights drawn from our visualizations, 
          it seems that the countries with the highest scores are mostly first 
          world countries such as the US, Canada, Finland with a few second world 
          countries. This finding is not surprising as first world countries have 
          stable economies and high standards of living, allowing them to have high 
          index scores."),
        p("We learned that many countries were able to develop countermeasures
          for COVID-19 but but every country still struggles to be prepared for
          another global pandemic or epidemic in the future. The highest score 
          barely breaks the 75th percentile and is not very good when looking
          at the big picture. In addition, between 2019 and 2021, may countries 
          have seen little change in their score, meaning they have not taken
          action towards future prevention of outbreaks which may lead to very
          large problems that we may not be able to solve. For example, the US
          score was 76.2 in 2019. In 2021, their score dropped to 75.9 which means
          the US has gotten worse. Also, looking at the bar chart, we can see that
          there is an 11 point difference between the #1 country and #10 country, 
          implying that there are not many countries with high index scores."),
        p("In addition, we found that the continents with the highest index scores 
          were in North America and Europe. As stated before, most of the countries
          within these continents are first world countries with high income and so
          it would be expected for them to have high scores. The continent with the
          most noticeable lowest scores is Africa. Not including South Africa, every 
          country in Africa seems to fall above the 100th ranking which mean they are
          below the 50th percentile of countries. Based on our research and analysis 
          of this data, it is clear that the implications of global health security, 
          are extremely important and is something all countries should invest into, 
          as we never know when another pandemic can strike again.")
      ),
      
      mainPanel(
        img(src = "https://www.irmi.com/images/default-source/article-images/workers-comp/doctor-holding-globe-with-medical-mask.jpg?sfvrsn=6",
            width = "85%", height = "85%")
        )
      )
    )
  )
)
)

