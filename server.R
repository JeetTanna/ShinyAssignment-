library(shiny)
data("mtcars")

# Define server logic required to draw a scatterplot
shinyServer(function(input, output) {
    # 1
    hp<-mtcars$hp
    mpg<-mtcars$mpg
    model1<-lm(mpg~hp)
    # 2
    model1pred<-reactive({
        hpInput<-input$sliderhp
        predict(model1, newdata=data.frame(hp=hpInput))
    })
    
    # 4
    output$plot1<-renderPlot({
        hpInput<-input$sliderhp
        plot(mtcars$hp, mtcars$mpg, xlab = "HP", ylab = "MPG", bty="n", pch=16)
        points(hpInput, model1pred(), col="red", pch=16, cex=2)
    })
    
    # 5
    output$pred1<-renderText({
        model1pred()
    })
    
})
