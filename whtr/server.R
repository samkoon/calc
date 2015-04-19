library(shiny) 

whtr<-function(waist,height) {round(waist/(height),2)}

diagnostic_f<-function(waist,height,sex){
        whtr_value <- round(waist/(height),2)
        if (sex == 'male') {
                ifelse(whtr_value<0.36,"Extremely Slim",ifelse(whtr_value>0.34 & whtr_value<0.43 ,"Underweight",ifelse(whtr_value>0.42 & whtr_value<0.53 ,"Healthy","Overweight")))

        }
        else {
                ifelse(whtr_value<0.36,"Extremely Slim",ifelse(whtr_value>0.34 & whtr_value<0.42 ,"Underweight",ifelse(whtr_value>0.42 & whtr_value<0.49 ,"Healthy","Overweight")))
        }
}
shinyServer(
        function(input, output) {
                output$inputsexvalue <- renderPrint({input$sex})
                output$inputwaistvalue <- renderPrint({input$waist})
                output$inputheightvalue <- renderPrint({input$height})
                output$estimation <- renderPrint({whtr(input$waist,input$height)})
                output$diagnostic <- renderPrint({diagnostic_f(input$waist,input$height,input$sex)})
        } 
)
