shinyUI(pageWithSidebar(
    headerPanel("Example of plotting function with parameter"),
  
    sidebarPanel(
              
        numericInput('a', 'Starting point a', 0, min = 0, max = 10),
        numericInput('h', 'Lenght of segment h', 1, min = 1, max = 10),
       
        sliderInput('mu', 'Parameter mu',
                    value = 2, min = 1, max = 5, step = 0.05),
        radioButtons('color', 'Curve color',
                    choices =   c("red", "blue", "green"))
    ),
    mainPanel(
        h4('y(x)=sin(cos(x*mu)*exp(-x/mu)), x in [a,a+h]'),
        tabsetPanel(
        tabPanel("Curve",plotOutput('myPlot')),
        tabPanel("Table", tableOutput("table"))
        ),
        h4('You entered'),
        h5('mu'),
        verbatimTextOutput("mu"),
        h5(' [a,a+h ] '),
        verbatimTextOutput("a_h")
    )
))
