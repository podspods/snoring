library(shiny)
load("snoring.rda")

nuagePoint <- glm(RONFLE~AGE+POIDS+TAILLE+nb.alcool+sexe+tabac,data=ronfle, family="binomial")

shinyServer
(
    function(input, output) 
    {
      
#         output$prediction <- renderPrint({
#             
#             myDataFrame <- data.frame(AGE=as.numeric(input$SAge), 
#                                     POIDS=as.numeric(input$SWeight), 
#                                     TAILLE=as.numeric(input$STall),
#                                      nb.alcool=as.factor((input$SAlcool)),
#                                     sexe=as.factor((input$CSexe)),
#                                     tabac=as.factor((input$CTabac)))            
#             risque = ifelse((predict(nuagePoint, myDataFrame) <0) ,1000,2)
#             
#             paste("predit:",predict(nuagePoint, myDataFrame),
#                   "preit *7",   ((predict(nuagePoint, myDataFrame)+5) *7),
#                   "risque",   (35+((predict(nuagePoint, myDataFrame)+5) *7)),
#                   "risqueifelse", risque
#             )
#             
#         })
        
        output$sortiPLot <- renderPlot({
        
            myDataFrame <- data.frame(AGE=as.numeric(input$SAge), 
                                      POIDS=as.numeric(input$SWeight), 
                                      TAILLE=as.numeric(input$STall),
                                      nb.alcool=as.factor((input$SAlcool)),
                                      sexe=as.factor((input$CSexe)),
                                      tabac=as.factor((input$CTabac)))            

          
            risque = (35+((predict(nuagePoint, myDataFrame)+5) *7))
            risque = ifelse(risque <0 | risque >100,35,risque)
            tabRef["oui"]<-risque 
            tabRef["non"]<-100-risque 

            
            pie(tabRef, 
                labels = c("quiet night","Snoring"), 
                edges = 200, 
                radius = 1,
                clockwise = FALSE,
                density = 70,
                col = c(3,2),
                init.angle=90,
                main = "Probability of a quiet night")
            
        
        })                
        
    
    }        
)
    
