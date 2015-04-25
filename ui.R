library(shiny)

shinyUI
(
    fluidPage
    (
    
        titlePanel("The curse of the snorer's roomate "),
        sidebarLayout
        (
            sidebarPanel(
            
                radioButtons("CSexe", "Sexe",
                          c("Female" = "femme",
                            "Male" = "homme")),
            
                sliderInput("SAge", "Age", 
                            min = 23, max = 74, value = 25),
                
                sliderInput("SWeight", "weight (kg)", 
                            min = 42, max = 120, value = 60),
                
                sliderInput("STall", "Tall (cm)", 
                            min = 158, max = 208, value = 170),
                
                sliderInput("SAlcool", "how many Alcool (drink per day) ?", 
                            min = 0, max = 7, value = 0),
                
                radioButtons("CTabac", "Tabaco",
                             c("Tabaco no" = "No",
                               "Tabaco Yes" = "Yes"))
            
            ),
            mainPanel
            (
                plotOutput('sortiPLot'),
#                 verbatimTextOutput("prediction"),
h5 ('This app is based on a subset of  University Hospital Center of Angers (France)'),

h5 ('Monitoring people from ANGERS to studie  women and men for their ability to snore.')
    
    

            )
        )
    )
)