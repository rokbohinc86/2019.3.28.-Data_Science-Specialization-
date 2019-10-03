rankhospital <- function(state, out, num = "best") {
    ## Read outcome data
    outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    ## Set the outputs to numeric form
    for (i in c(11, 17, 23)) {
        outcome[, i] <- as.numeric(outcome[, i])
    }
    
    
    ## Check that state and outcome are valid
    HStates <- unique(outcome[,7])
    PosOutcome <- c("heart attack", "heart failure", "pneumonia")
    checkOutcome <- sum(PosOutcome == out)
    checkNames <- sum(HStates == state)
    if(checkOutcome == 0){
        stop("invalid outcome")
    }
    if(checkNames == 0){
        stop("invalid state")
    }
    
    
    ## Return hospital name in that state with the given rank
    outcomeindicator <- data.frame(outcomes = PosOutcome, indicator =c (11,17,23))
    indicator <- outcomeindicator[outcomeindicator$outcomes==out,2]
    ROrdering <- outcome[outcome$State == state,][c(indicator,2)]
    GOrdering <- ROrdering[ order(ROrdering[,1], ROrdering[,2], na.last = NA), ]
    
    if(num == "best") {
        return(GOrdering[[1,2]])}
    else if(num == "worst"){
        return(GOrdering[[dim(GOrdering)[1],2]])
    }
    else if(num > dim(GOrdering)[1]){
        return(NA)
    }
    else{
        return(GOrdering[[num,2]])
    }
}