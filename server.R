

function(input, output) {
    
    output$main_plot <- renderPlot({
        
        hist(mtcars$mpg,
             probability = TRUE,
             breaks = as.numeric(input$n_breaks),
             xlab = "Miles per Gallon",
             main = "Miles Per Gallon Counts")
        
        if (input$individual_obs) {
            rug(mtcars$mpg)
        }
        
        if (input$count) {
            dens <- count(mtcars$mpg,
                            adjust = input$bw_adjust)
            lines(dens, col = "blue")
        }
        
    })
}


