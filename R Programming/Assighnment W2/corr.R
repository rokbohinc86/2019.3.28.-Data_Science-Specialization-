corr <-function(directory,treshold = 0){
    var<-vector(mode = "integer")
    
    for (i in 1:length(dir("specdata"))) {
        if(Ncomplete(readdata(directory,i))>treshold){
            var <- append(var,corr1(directory,i))
        }
    }
    var
}

corr1 <-function(directory,id=1){
    data<-readdata(directory,id)
    reldata <- data[(!is.na(data[,2])) & (!is.na(data[,3])), 2:3]
    cor(reldata[,1], reldata[,2])
}

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
