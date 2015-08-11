library(shinyapps)

# Function with parameter
fun <- function(x,mu) 
    sin(cos(mu*x)*exp(-x/mu))

shinyServer(
    function(input, output) {
        # Generate function plot   
        output$myPlot <- renderPlot({
            mu <- input$mu
            a<-input$a
            h<-input$h
            curve(fun(x,mu), a, a+h, n = 1001, 
                  col=input$color, ylab="y(x)")
           })
    
    # Generate echo of user input
    output$mu <- renderPrint({input$mu})
    output$a_h <- renderPrint(paste0("x in [",{input$a},",",{input$a}+{input$h},"]"))
   
    # Generate table view of the function value
    output$table <- renderTable({
    mu <- input$mu
    a<-input$a
    h<-input$h
    x=seq(a,a+h,by=0.5)
    y=fun(x,mu)
    data.frame(x,y)
    })
})
        