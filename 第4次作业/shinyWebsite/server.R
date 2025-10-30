source("public_functions.R")
library(plotly)
library(timevis)

function(input, output, session) {
  
  ##################### Home Page START! ##################### 
  
  output$download_resume <- downloadHandler(
    filename = function() {
      "marcella_resume.pdf"
    },
    content = function(file) {
      file.copy("www/marcella_resume.pdf", file)
    }
  )
  ##################### Home Page END! ##################### 
  
  ##################### Resume Visualizations START! #####################
  
  # Skills Radar Chart
  output$skillsRadar <- renderPlotly({
    skills <- data.frame(
      Skill = c("R", "Python", "Data Viz", "Web Scraping", "NLP", "ML", "Communication"),
      Score = c(9, 8, 8, 7, 7, 7, 9)
    )
    
    plot_ly(
      type = 'scatterpolar',
      r = skills$Score,
      theta = skills$Skill,
      fill = 'toself',
      mode = 'markers'
    ) %>%
      layout(
        polar = list(
          radialaxis = list(
            visible = TRUE,
            range = c(0,10)
          )
        ),
        showlegend = FALSE,
        margin = list(l = 50, r = 50, b = 50, t = 50)
      )
  })
  
  # Education Timeline
  output$educationTimeline <- renderTimevis({
    data.frame(
      id = 1:3,
      content = c("Started at Shantou", "Type C Scholarship", "Guangdong Scholarship"),
      start = c("2022-09-01", "2023-06-15", "2024-05-20"),
      end = c(NA, NA, NA),
      type = c("range", "point", "point")
    ) %>%
      timevis(options = list(showCurrentTime = FALSE))
  })
  
  # Bilibili Project Timeline
  output$bilibiliTimeline <- renderPlotly({
    plot_ly(
      data = data.frame(
        Date = seq.Date(from = as.Date("2024-01-01"), by = "week", length.out = 10),
        Videos = sample(50:150, 10)
      ),
      x = ~Date,
      y = ~Videos,
      type = 'bar',
      marker = list(color = '#0a66c2')
    ) %>%
      layout(
        title = "Videos Collected Per Week",
        xaxis = list(title = ""),
        yaxis = list(title = "Number of Videos")
      )
  })
  
  ##################### Resume Visualizations END! #####################
  
  ##################### Statistic Pages START! ##################### 
  get.slider.year.range <- reactive({
    data.frame(
      start = input$year.range[1],
      end = input$year.range[2]
    )
  })
  
  load("data/statistics/publications.statistics.RData")
  
  output$plot.publications.count <- renderEcharts4r({
    data4plot <- publications.statistics.data 
    range <- get.slider.year.range()
    data4plot <- subset(data4plot, Year <= range$end & Year >= range$start)
    statistic.data <- get.statistic.data4echart4r(data4plot)
    
    width = 20
    statistic.data %>% 
      e_charts(years) %>% 
      e_bar(tools, barWidth = width) %>% 
      e_pictorial(papers, symbol = "rect", symbolRepeat = TRUE, z = 1, 
                  symbolSize = c(width, 4)) %>% 
      e_theme("westeros") %>% 
      e_title("", subtext = "The counts of publications")
  })
  
  output$plot.tools.count <- renderPlot({
    data4plot <- subset(publications.statistics.data, Type == "Tools")
    range <- get.slider.year.range()
    data4plot <- subset(data4plot, Year <= range$end & Year >= range$start)
    
    ggplot(data4plot) +
      geom_bar(aes(x = as.factor(Year), fill = Journal)) +
      ylab("The counts of tools") +
      xlab("Year") +
      coord_flip() +
      theme_bw() 
  })
  ##################### Statistic Pages END! #####################
  
  ##################### Browse Data Page START! #####################
  output$showtable = DT::renderDataTable({
    datatable(mtcars, extensions = 'Responsive')
  })
  ##################### Browse Page END! #####################  
  
  ##################### Network Pages Start! #####################
  load("data/networks/tool.review.edge.data.RData")
  load("data/networks/tool.review.node.data.RData")
  
  get.network.slider.year.range <- reactive({
    data.frame(
      start = input$network.range[1],
      end = input$network.range[2]
    )
  })
  
  output$plot.network <- renderEcharts4r({
    range <- get.network.slider.year.range()  
    nodes <- subset(tool.review.node.data, year <= range$end & year >= range$start)
    nodes$citation <- nodes$citation + 10
    edges <- tool.review.edge.data
    
    e_charts() %>% 
      e_graph() %>% 
      e_graph_nodes(nodes, pmid, citation, size, type) %>% 
      e_graph_edges(edges, source, target) %>% 
      e_tooltip() %>%
      e_show_loading()
  })
  ##################### Network Pages End! #####################
  
  ##################### Dataset Visualization Tab #####################
  output$dataset_preview <- DT::renderDataTable({
    dataset <- get(input$selected_dataset)
    datatable(dataset, extensions = 'Responsive', options = list(pageLength = 5))
  })
  
  output$xcol_ui <- renderUI({
    dataset <- get(input$selected_dataset)
    selectInput("xcol", "X Axis", choices = names(dataset))
  })
  
  output$ycol_ui <- renderUI({
    dataset <- get(input$selected_dataset)
    selectInput("ycol", "Y Axis", choices = names(dataset))
  })
  
  output$dataset_plot <- renderPlotly({
    req(input$xcol, input$ycol, input$selected_dataset)
    dataset <- get(input$selected_dataset)
    
    p <- ggplot(dataset, aes_string(x = input$xcol, y = input$ycol)) +
      switch(input$plot_type,
             "Scatter" = geom_point(),
             "Bar" = geom_bar(stat = "identity"),
             "Line" = geom_line()
      ) +
      theme_minimal()
    
    ggplotly(p)
  })
  ##################### Dataset Visualization END #####################
}