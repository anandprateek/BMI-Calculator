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
