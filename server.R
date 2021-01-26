library(shiny)
shinyServer(function(input, output) {
    values <- reactiveValues()
    # Calculate the interest and amount
    observe({
        input$Calculate
        values$int <- isolate({
            input$Weight / ((input$Height/100)^2)
        })
    })
    # Display values entered
    output$Nametxt <- renderText({
        input$Calculate
        paste("Name:",isolate(input$name))
    })
    
    output$Weighttxt <- renderText({
        input$Calculate
        paste("Your Weight(in kg): ", isolate(input$Weight), " kg")
    })
    
    output$Heighttxt <- renderText({
        input$Calculate
        paste("Your Height(in cm): ", isolate(input$Height)," cm")
    })
    
    output$BMItxt <- renderText({
        if(input$Calculate == 0) ""
        else
            HTML(paste("Your BMI is: ",values$int))
    })
    
})
