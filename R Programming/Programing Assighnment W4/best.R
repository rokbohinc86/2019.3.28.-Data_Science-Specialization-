best <- function(state, out) {
    
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
    
    ## Return hospital name in that state with lowest 30-day death
    ## rate
    outcomeindicator <- data.frame(outcomes = PosOutcome, indicator =c (11,17,23))
    indicator <- outcomeindicator[outcomeindicator$outcomes==out,2]
    
    AllVals <- outcome[,indicator][outcome$State == state]
    BestVal <- min(AllVals, na.rm = TRUE)
    Positions <- sapply(AllVals == BestVal, function(x) if(toString(x) == "NA") {FALSE} else {x})
    HNames <- outcome[outcome$State == state,][Positions,2]
    HNames[1]
}