Body Mass Index Calculator
========================================================
author: Prateek Anand
date: 26-01-2021
autosize: true
--
Introduction
========================================================
Body Mass Index (BMI) is a person’s weight in kilograms divided by the square of height in meters. A high BMI can be an indicator of high body fatness. BMI can be used to screen for weight categories that may lead to health problems but it is not diagnostic of the body fatness or health of an individual.

Shiny App Link: BMI CALCULATOR
========================================================
Copy the following link into your browser to run the application
"https://thewhitepigeon.shinyapps.io/BMICalculator"

ui.R
========================================================

```r
library(shiny)
shinyUI(fluidPage(
    titlePanel("BMI Calculator"),
    sidebarLayout(
        sidebarPanel(
            textInput("name", "Enter your Name"),
            sliderInput("Weight", label = h5("Move the slider to enter your weight (in kilograms)"), min = 0, max = 150, value = 5),
            sliderInput("Height", label = h5("Move the slider to enter your height (in centimeters)"), min = 0, max = 200, value = 5),
            actionButton("Calculate", label = "Calculate")
        ),
        
        mainPanel(
            tabsetPanel(
                tabPanel("Results",
                         HTML("<br>"),
                         p(tags$b(h5("Your details:"))),
                         textOutput("Nametxt"),
                         textOutput("Weighttxt"),
                         textOutput("Heighttxt"),
                         p(h5("Calculated values:")),
                         tags$b(textOutput("BMItxt")),
                         HTML("<br>
                     <u><i>Which range do you fall into?</i></u>
                                <br> <br>
                                <b>Underweight:</b> BMI less than 18.5
                                <br>
                                <b>Normal Weight:</b> BMI bewtween 18.5 and 24.9
                                <br>
                                <b>Overweight:</b> BMI between 25 and 29.9
                                <br>
                                <b>Obesity!!:</b> BMI over 30
                                ")
                ),
                
                tabPanel("What is BMI?",
                         HTML("<br>
                         <u><b>Body Mass Index(BMI)</b></u>
                                <br> <br>
                                Body Mass Index (BMI) is a person’s weight in kilograms divided by the square of height in meters.
                                A high BMI can be an indicator of high body fatness.
                                BMI can be used to screen for weight categories that may lead to health problems but it is not diagnostic of the body
                                fatness or health of an individual.
                                <br> <br> <br>
                                <u><b>Method for calculation of BMI: </b></u>
                                <br> <br>
                                <b>BMI = [Wt / Ht²]</b>
                                <br><br>
                                where: <br>
                                Wt = Weight in kilograms <br>
                                Ht = Squared Height in metres <br>
                                BMI = Body Mass Index")
                )
            )
        )
    )
))
```

<!--html_preserve--><div class="container-fluid">
<h2>BMI Calculator</h2>
<div class="row">
<div class="col-sm-4">
<form class="well">
<div class="form-group shiny-input-container">
<label class="control-label" for="name">Enter your Name</label>
<input id="name" type="text" class="form-control" value=""/>
</div>
<div class="form-group shiny-input-container">
<label class="control-label" for="Weight">
<h5>Move the slider to enter your weight (in kilograms)</h5>
</label>
<input class="js-range-slider" id="Weight" data-min="0" data-max="150" data-from="5" data-step="1" data-grid="true" data-grid-num="10" data-grid-snap="false" data-prettify-separator="," data-prettify-enabled="true" data-keyboard="true" data-data-type="number"/>
</div>
<div class="form-group shiny-input-container">
<label class="control-label" for="Height">
<h5>Move the slider to enter your height (in centimeters)</h5>
</label>
<input class="js-range-slider" id="Height" data-min="0" data-max="200" data-from="5" data-step="1" data-grid="true" data-grid-num="10" data-grid-snap="false" data-prettify-separator="," data-prettify-enabled="true" data-keyboard="true" data-data-type="number"/>
</div>
<button id="Calculate" type="button" class="btn btn-default action-button">Calculate</button>
</form>
</div>
<div class="col-sm-8">
<div class="tabbable">
<ul class="nav nav-tabs" data-tabsetid="3488">
<li class="active">
<a href="#tab-3488-1" data-toggle="tab" data-value="Results">Results</a>
</li>
<li>
<a href="#tab-3488-2" data-toggle="tab" data-value="What is BMI?">What is BMI?</a>
</li>
</ul>
<div class="tab-content" data-tabsetid="3488">
<div class="tab-pane active" data-value="Results" id="tab-3488-1">
<br>
<p>
<b>
<h5>Your details:</h5>
</b>
</p>
<div id="Nametxt" class="shiny-text-output"></div>
<div id="Weighttxt" class="shiny-text-output"></div>
<div id="Heighttxt" class="shiny-text-output"></div>
<p>
<h5>Calculated values:</h5>
</p>
<b>
<div id="BMItxt" class="shiny-text-output"></div>
</b>
<br>
                     <u><i>Which range do you fall into?</i></u>
                                <br> <br>
                                <b>Underweight:</b> BMI less than 18.5
                                <br>
                                <b>Normal Weight:</b> BMI bewtween 18.5 and 24.9
                                <br>
                                <b>Overweight:</b> BMI between 25 and 29.9
                                <br>
                                <b>Obesity!!:</b> BMI over 30
                                
</div>
<div class="tab-pane" data-value="What is BMI?" id="tab-3488-2"><br>
                         <u><b>Body Mass Index(BMI)</b></u>
                                <br> <br>
                                Body Mass Index (BMI) is a person’s weight in kilograms divided by the square of height in meters.
                                A high BMI can be an indicator of high body fatness.
                                BMI can be used to screen for weight categories that may lead to health problems but it is not diagnostic of the body
                                fatness or health of an individual.
                                <br> <br> <br>
                                <u><b>Method for calculation of BMI: </b></u>
                                <br> <br>
                                <b>BMI = [Wt / Ht²]</b>
                                <br><br>
                                where: <br>
                                Wt = Weight in kilograms <br>
                                Ht = Squared Height in metres <br>
                                BMI = Body Mass Index</div>
</div>
</div>
</div>
</div>
</div><!--/html_preserve-->

server.R
========================================================

```r
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
```

