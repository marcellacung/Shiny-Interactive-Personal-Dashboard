


get.statistic.data4echart4r <- function( data ){
  #data <- data4plot
  years <- sort(unique(data$Year))
  statistic.data <- data.frame()
  for( y in years ){
    temp <- subset(data, Year == y)
    publications.count = nrow(temp)
    temp <- subset(temp, Type == "Tools")
    tools.count = nrow(temp)
    tp <- data.frame(years = as.character(y),
                     tools = tools.count,
                     papers = publications.count)
    statistic.data <- rbind(statistic.data,tp)
  }
  return(statistic.data)
}






