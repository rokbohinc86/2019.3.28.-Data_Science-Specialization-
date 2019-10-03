pollutantmean <- function(dirname, pollutant, id = 1:332){
    
    vals <- vector(mode = "numeric")
    
    for(i in id) {
        data <- readdata(dirname,i)
        vals <-append(vals, data[[pollutant]])
    }
    mean(vals, na.rm = TRUE)
}

readdata <- function(dirname, id = 1){
    fn <- dir(dirname)
    data <- read.csv(paste(dirname,"/", fn[id], sep = ""))
    data
}
