library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Predict MPG in mtcars data with HP"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderhp","What is the HP value?", min = 52, max = 335, value = 10),
            submitButton("Submit") # SubmitButton is handy for delayed reactivity where your server.R function includes calculation intensive algorithm
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("plot1"),
            h4("Predicted MPG Level from the model (Red Circle):"),
            textOutput("pred1"),
            h6("A Quick Quide to Users: Enter the value of the HP with the above slider then press on Submit button")
        )
    )
))

