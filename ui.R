library(shiny)
shinyUI(fluidPage(
    titlePanel("Body Mass Index (BMI) Calculator"),
    sidebarLayout(sidebarPanel(
        helpText("The body mass index (BMI) calculator. Please enter your mass and height."),
        sliderInput(
            inputId = "height",
            label = strong("Your height in cm:"),
            min = 100,
            max = 240,
            value = 185
        ), #User height input slider
        sliderInput(
            inputId = "mass",
            label = strong("Your weight in kg:"),
            min = 20,
            max = 150,
            value = 74
        ) #User mass input slider
    ),
    
    mainPanel(
        uiOutput("user_data"), #Text with the user data
        plotOutput("plot", height = "175px", width = "100%"), #Colorful plot of the user BMI
        uiOutput("results"), #Text results
        h4("The BMI is an attempt to quantify the amount of tissue mass (muscle, fat, and bone) in an individual, and then categorize that person as underweight, normal weight, overweight, or obese based on that value."),
        tabsetPanel(type = "tabs", 
                    tabPanel("What is BMI ?", br(), textOutput("out1")), 
                    tabPanel("Consequences", br(), textOutput("out2"))
        ),
        br(),
        br(),
        br(),
        br(),
        strong("Made by Shreyash Mishra as a project for the Coursera Course: Developing Data Products.")
    ))
))
