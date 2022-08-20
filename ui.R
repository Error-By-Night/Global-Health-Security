library(shiny)
library(shinythemes)
library(plotly)
library(tidyverse)

ui <- fluidpage(
  theme = shinytheme("darkly"),
  
  titlePanel("The Global Health Security: An analysis on GHS Indexes around the World"),
  
  tabsetPanel(
    introduction <- tabPanel(
      "Introduction",
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
            P("**What countries had the highest GHS Index Scores in both 2019 and 2021**"),
            p("**What continents had higher GHS Scores**"),
            h3("About Us"),
            p("Authors: Aanyk Mann, Joey Kang"),
            p("INFO 201 - University of Washington"),
        ),

      mainPanel(
        img(src = "gshaseoul.png",
            width = "95%", height = "95%"),
        p(""),
        img(src = "ghspic.jpg",
            width = "95%", height = "95%"),
      ),
  
      ghs_table <- tabPanel(
        "Table for GHS",
        sidebarLayout(
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
          )
        )
      ),

    mainPanel(
      plotlyOutput(outputId = "GHS_final"),
      p(em("This table shows the global health index score of a pool of countries 
              along with the year that the data was gathered. We extracted a random pool 
              of 20 countries to give an example of how drastic the difference of safety 
              can be within countries and even continents. The information displays how in
              countries within Africa there is a much lower index score versus those in Europe or North America. "
          )
      )
    ),

    ghs_scatter_plot <- tabPanel(
      "Scatter Plot for GHS",
      sidebarLayout(
        sidebarPanel(
          selectInput(
            inputId = "country",
            label = h3("Select Country"),
            choices = unique(GHS_row$Country)
          )
        )
      )
    ),
      
    mainPanel(
      plotlyOutput(outputId = "GHS_scatterchart"),
      p("The scatterplot shows the dots of selected values in 2019 with each country's name 
      written over the datapoint. The scatterplot here shows a wide range of numbers, 
      indicating the contrasting indexes between countries. There also seems to be many 
      countries clustered around each other as well depending on the continent they are in.")
    )
  ),
  
  tabPanel("Conclusion", fluid = TRUE, sidebarLayout(
    sidebarPanel(
      h3("CONCLUSION"),
      p("According to the insights gathered from the visualizations,
          it seems that a majority of terrorist attacks that occurred in 
          the 21st century were targeted at countries in Africa and the Middle East.
          That is not too shocking, given the political unrest and wars occurring
          in those regions of the world."),
      p("We learned that global terrorism is much too broad, complex,
        and large of an issue to make causal or predictive claims and analyses.
        However, through discussion about research questions, data visualizations,
        and future plans, we have learned to develop our critical thinking
        and coding skills. Another noteworthy lesson we learned was that it
        can be difficult to find datasets to fit our needs, and sometimes,
        we need to challenge ourselves to work with what we have available
        and to generate creative solutions."),
      p("Additionally, we found that the most terror attacks occurred
          in the Middle East and South Asia. There was a total of about
          forty-one thousand attacks in the Middle East and about 39 thousand
          in South Asia. The attacks the city targeted are mainly in Afghanistan
          and Iraq. Interestingly, the Philippines was ranked first in Southeast 
          Asia for the greatest number of terrorist attacks. The Philippines had 
          nearly five thousand attacks.")
      
      )
    )
  )
  )
)


