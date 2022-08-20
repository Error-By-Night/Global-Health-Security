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
              wherever they occur in the world. Its main goal is to  to minimize the danger and impact of acute public health events 
              that endanger people's health across geographical regions and international boundaries."),
      p("With everything happening in our world today with Covid-19, global health security is extremely important,
              especially for countries who don't have the money or resources to comabt it. Being perpared for events like this
              can save millions of lives and benefit all of humanity. When doing this project we wanted to look deeper into this topic
              so to do so we used the GHS Index which is a data source which assesses countriess health security and capabilies
              across six categories and 37 indicators."),
      h3("Research Questions"),
      p("**What countries had the highest GHS Index Scores in both 2019 and 2021**"),
      p("**What continents had higher GHS Scores**"),
      h3("About Us"),
      p("Authors: Aanyk Mann, Joey Kang"),
      p("INFO 201 - University of Washington"),
    ),
    
    mainPanel(
      img(src = "imgs/gshaseoul.png",
          width = "95%", height = "95%"),
      p(""),
      img(src = "imgs/ghspic.jpg",
          width = "95%", height = "95%"),
    )
    )
  ),
    
  tabPanel("Table for GHS", fluid = TRUE, sidebarLayout(
        sidebarPanel(
          checkboxGroupInput(
            "year",
            label = h3("Select Year"),
            choices = list("2019 = 2019", "2021 = 2021")
          ),
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
              countries within Africa there is a much lower index score versus those in Europe or North America. "
          )
          )
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
            plotlyOutput(outputId = "GHS_scatterchart"),
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
          the US has gotten worse."),
        p("In addition, we found that the continents with the highest index scores 
          were in North America and Europe. As stated before, most of the countries
          within these continents are first world countries with high income and so
          it would be expected for them to have high scores. The continent with the
          most noticeable lowest scores is Africa. Not including South Africa, every 
          country in Africa seems to fall above the 100th ranking which mean they are
          below the 50th percentile of countries.")
      ),
      
      mainPanel(
        img(src = "https://www.irmi.com/images/default-source/article-images/workers-comp/doctor-holding-globe-with-medical-mask.jpg?sfvrsn=6",
            width = "65%", height = "65%")
        )
      )
    )
  )
)
)

