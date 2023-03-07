library(tidyverse)
library(shiny)

salaries <- read_delim("data/ds_salaries.csv")

# Define UI for application that draws a histogram
ui <- fluidPage(
  mainPanel(
    tabsetPanel(
      tabPanel("About", 
               titlePanel("Salaries of Careers in Informatics"),
               mainPanel(
                 p("This app uses data about saleries and careers collected from", 
                   strong("kaggle.com")),
                 p("The dataset contains ", n_distinct(salaries$job_title), "different careers, and are from ", 
                   n_distinct(salaries$work_year), "different years."),
                 p("Here is a small random sample from the dataset:"),
                 tableOutput("dataSample")
               )),
      tabPanel("Plot", 
               titlePanel("Informatics Career Salary Visual Presentation"),
               p("This page displays visual representation of data for further 
                 understanding and comparision."),
               sidebarPanel(
                 checkboxInput("checkbox", "Show Trend", value = TRUE),
                 radioButtons("theme", "Select Color Theme", choices = list(
                   "Spectral", "Accent", "Dark2")),
                 checkboxGroupInput("job1", "Select Career(s)",
                                    choices = unique(salaries$job_title))
               ),
               mainPanel(
                 textOutput("sum"),
                 plotOutput("plot", width = "800"),)
               ),
      tabPanel("Table", 
               titlePanel("Informatics Career Salary Data Table"),
               p("This page displays the average salary by each careers for each 
                 listed variables."),
               sidebarPanel(
                 selectInput("job2", "Select Career", 
                              choices = unique(salaries$job_title)),
                 radioButtons("option", "Select Option", 
                              choices = c("experience_level", "employment_type", 
                                          "employee_residence", "company_location",
                                          "company_size", "work_year"))
               ),
               mainPanel(
                 textOutput("num"),
                 tableOutput("table"))
               )
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$dataSample <- renderTable({
    salaries %>% 
      sample_n(5)
  }, digits = 0)
  
  output$sum <- renderText({
    sum <- salaries %>% 
      filter(job_title %in% input$job1) %>% 
      distinct(job_title) %>% 
      nrow()
    if (sum == 0) {
      paste("Please select at least one career to view graph.")
    } else {
      paste(c("You currently have", sum, "different careers 
            selected to be compared."))
    }

  })
  
  output$plot <- renderPlot({
    salaries %>% 
      filter(job_title %in% input$job1) %>% 
      ggplot(aes(work_year, salary_in_usd, col = job_title)) + 
        geom_point() +
        scale_color_brewer(palette = input$theme) +
        if (input$checkbox == TRUE) {
          geom_smooth(method = lm) 
        } 
  })
  
  output$table <- renderTable({
    salaries %>% 
      group_by(across(input$option)) %>% 
      filter(job_title %in% input$job2) %>% 
      select(job_title, salary_in_usd) %>% 
      summarise(ave_salary_in_usd = mean(salary_in_usd))
  }, digits = 0)
  
  output$num <- renderText({
    num <- salaries %>% 
      filter(job_title %in% input$job2) %>% 
      nrow()
    min <- salaries %>% 
      filter(job_title %in% input$job2) %>% 
      select(salary_in_usd) %>% 
      min()
    max <- salaries %>% 
      filter(job_title %in% input$job2) %>% 
      select(salary_in_usd) %>% 
      max()
    paste(c("There are ", num, "different data points summarized in the 
            following table", "with salaries ranging from $", min, "to $", max))
  })
}

# Run the application 
shinyApp(ui = ui, server = server)