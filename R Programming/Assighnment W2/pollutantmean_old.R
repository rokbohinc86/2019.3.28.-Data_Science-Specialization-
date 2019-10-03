pollutantmean <- function(dirname, pollutant, id = 1:10){
    vals <- 0
    for(i in id) {
        vals <- append(vals, readcolumt(dirname, pollutant, i))
    }
    mean(vals, na.rm = TRUE)
}

readcolumt <- function(dirname, pollutant, id = 1){
    data <- read.csv(paste(dirname,"/",makeinput(id),".csv", sep = ""))
    data[,sorn(pollutant)]
}

makeinput <- function(int){
    desetica <- int>=10
    stotica <- int>=100
    if(!desetica){
        paste("00",as.character(int),sep="")
    }
    else if(!stotica){
        paste("0",as.character(int),sep="")
    }
    else {as.character(int)}
}

sorn <- function(char){
    if(char=="sulfate"){2}
    else {3}
}