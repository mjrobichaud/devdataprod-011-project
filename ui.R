library(shiny)
library(stats)
data(eurodist)
distances <- as.matrix(eurodist)
shinyUI(
    pageWithSidebar(
	headerPanel("European Travel Planner"),
	sidebarPanel(
	    selectInput(
                'from_city',
                'From',
                c(None='Select a city', rownames(distances))
            ),
	    selectInput(
                'to_city',
                'To',
                c(None='Select a city',  rownames(distances))
            ),
	    submitButton('Submit')
	),
	mainPanel(
            h4('Instructions'),
            p('Simply select two cities to determine the driving distance and estimated time between them.'),
	    h4('Driving distance in km'),
	    verbatimTextOutput("distance"),
	    h4('Estimated travel time in h (avg speed of 90 km/h)'),
	    verbatimTextOutput("time")
	)
    )
)
