readdata <- function(dirname, id = 1){
    fn <- dir(dirname)
    data <- read.csv(paste(dirname,"/", fn[id], sep = ""))
    data
}

Ncomplete <-function(data){
    temp=!apply(data[,2:3], 2, is.na)
    check <- vector()
    for (i in 1:dim(temp)[[1]]) {
        check[i] <- if(temp[[i,1]] & temp[[i,2]]){1}
        else{0}
    }
    sum(check)
}

complete <- function(dirname, id = 1:10) {
    
    nobs <- vector()
    
    for (i in id) {
        nobs = append(nobs, Ncomplete(readdata(dirname,i)))
    }
    
    DF <- data.frame("id" = id, "nobs" = nobs)
    DF
}