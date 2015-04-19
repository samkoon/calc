library(shiny) 
shinyUI(
        pageWithSidebar(
                # Application title
                headerPanel(
                        h1("Waist to Height Ratio (WHtR) Calculator", 
                                style = "font-family: 'Lobster', cursive;
                                font-weight: 500; line-height: 1.1; 
                                color: #ad1d28;"),
                        tags$head(tags$style("body {background-color: PapayaWhip; }"))
                        ),
                
                sidebarPanel(
                        selectInput("sex", "Sex:", choices = c("Male" = "male","Female" = "female")),
                        numericInput('waist', 'Waist Size in cm', 70) ,
                        numericInput('height', 'Height in cm', 100, min = 20, max = 200, step = 1),
                        submitButton('Submit')
                ), 
                mainPanel(
                        p('The waist-to-height ratio (WHtR) of a person is defined as the person waist circumference, divided by the person height.', style="color: blue;"),
                        p('The WHtR is a measure of the distribution of body fat. Higher values of WHtR indicate higher risk of obesity-related cardiovascular diseases.', style="color: blue;"),
                        p('As a comparative, the following categorises the boundaries of persons in terms of health:', style="color: blue;"),
                        tags$div(
                                tags$ul(
                                        tags$li('Men/Women < 0.35 : Extremely Slim', style="color: blue;"),
                                        tags$li('Men [0.35-0.42] Women [0.35-0.41]  : Underweight', style="color: blue;"),
                                        tags$li('Men [0.43-0.52] Women [0.42-0.48]  : Healthy', style="color: blue;"),
                                        tags$li('Men >= 0.53 Women>= 0.49     : Overweight', style="color: blue;")
                                )
                        ),
                        
                        h4('You have entered the following data:', style="color: blue;"), 
                        p('Sex:', style="color: blue;"), verbatimTextOutput("inputsexvalue"),
                        p('Waist (cm):', style="color: blue;"), verbatimTextOutput("inputwaistvalue"),
                        p('Height (cm):', style="color: blue;"), verbatimTextOutput("inputheightvalue"),
                        p('Your Waist to Height Ratio is:', style="color: blue;"), verbatimTextOutput("estimation"),
                        p('You are:', style="color: blue;"),strong(verbatimTextOutput("diagnostic"))
                        
               
                )
                
        )   
)
