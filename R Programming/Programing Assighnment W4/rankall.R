rankall <- function(out, num = "best") {
    ## Read outcome data
    outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    ## Set the outputs to numeric form
    for (i in c(11, 17, 23)) {
        outcome[, i] <- as.numeric(outcome[, i])
    }
    
    
    ## Check that state and outcome are valid
    PosOutcome <- c("heart attack", "heart failure", "pneumonia")
    checkOutcome <- sum(PosOutcome == out)
    if(checkOutcome == 0){
        stop("invalid outcome")
    }
    
    ## For each state, find the hospital of the given rank
    outcomeindicator <- data.frame(outcomes = PosOutcome, indicator =c (11,17,23))
    indicator <- outcomeindicator[outcomeindicator$outcomes==out,2]
    s <- split(outcome, outcome$State)
    ordered <- lapply(s,orderagainstind, indic = indicator)
   
     ## Return a data frame with the hospital names and the
    ## (abbreviated) state name

    states <- do.call(rbind,lapply(ordered, function(x) x[1, c(7)]))
    
    if(num == "best") {
        hospitals <- do.call(rbind,lapply(ordered, function(x) x[1, c(2)]))
    }
    else if(num == "worst"){
        hospitals <- do.call(rbind,lapply(ordered, function(x) x[dim(x)[1], c(2)]))
    }
    else{
        hospitals <- do.call(rbind,lapply(ordered, function(x) x[num, c(2)]))
    }
    
    out <- as.data.frame(cbind(hospitals,states))
    colnames(out) <- c("hospital","state")
    out
}    

orderagainstind <- function(df, indic) {
    df[order(df[,indic],df[,2], na.last = NA),]
}