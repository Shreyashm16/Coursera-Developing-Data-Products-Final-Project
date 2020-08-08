library(shiny)
dat<-matrix(c(15, 1, 2.5 ,6.5 , 5, 5, 5), ncol = 1, nrow = 7)
shinyServer(function(input, output) {
    output$user_data <- renderText({
        paste0("<strong>","Your mass is ", input$mass, " kg and your height is ", input$height, " cm", "</strong>")
    })
    output$results <- renderText({
        bmi = round(input$mass/(input$height/100)^2, 1)
        if      (bmi <  15.0) cond = "<span style='color: red'>Very severely underweight</span>"
        else if (bmi <= 16.0) cond = "<span style='color: red'>Severely underweight</span>"
        else if (bmi <= 18.5) cond = "<span style='color: orange'>Underweight</span>"
        else if (bmi <= 25.0) cond = "<span style='color: green'>Normal</span>"
        else if (bmi <= 30.0) cond = "<span style='color: orange'>Overweight</span>"
        else if (bmi <= 35.0) cond = "<span style='color: red'>Obese Class I (Moderately obese)</span>"
        else if (bmi <= 40.0) cond = "<span style='color: red'>Obese Class II (Severely obese)</span>"
        else                  cond = "<span style='color: red'>Obese Class III (Very severely obese)</span>"
        paste0("Your BMI is ", "<strong>", bmi, "</strong>","<br>", " It is ", cond, " according to ", "<a href='https://en.wikipedia.org/wiki/Body_mass_index#Categories'>", "Wikipedia", "</a>"
        )
    })
    output$plot <- renderPlot({
        bmi = round(input$mass/(input$height/100)^2, 1)
        if (bmi>40) {bmi=40}
        barplot(dat, horiz = TRUE, yaxt="n", xlab = "BMI", main="Your BMI", col=c("darkred", "red", "orange", "green", "orange", "red", "darkred", "brown"))
        lines(x=c(bmi, bmi), y=c(0,1.2), col="blue", lwd=4)
    })
    output$out1 <- renderText({
        print("BMI is an attempt to quantify the amount of tissue mass (muscle, fat, and bone) in an individual, and then categorize that person as underweight, normal weight, overweight, or obese based on that value.The BMI is a convenient rule of thumb used to broadly categorize a person as underweight, normal weight, overweight, or obese based on tissue mass (muscle, fat, and bone) and height. Commonly accepted BMI ranges are underweight (under 18.5 kg/m2), normal weight (18.5 to 25), overweight (25 to 30), and obese (over 30).")
    })
    output$out2 <- renderText({
        print("The BMI ranges are based on the relationship between body weight and disease and death. Overweight and obese individuals are at an increased risk for the following diseases:
Coronary artery disease, Dyslipidemia, Type 2 diabetes, Gallbladder disease, Hypertension, Osteoarthritis,
Sleep apnea, Stroke, Infertility, At least 10 cancers(including endometrial, breast, and colon cancer) and Epidural lipomatosis.
Among people who have never smoked, overweight/obesity is associated with 51% increase in mortality compared with people who have always been a normal weight.")
    })
})
