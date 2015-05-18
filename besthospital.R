setwd("~/Documents/DataScience/RProgramming/hospitaldata");
library("stringr", lib.loc="/Library/Frameworks/R.framework/Versions/3.1/Resources/library");
# just a comment to test GIT
# and another comment

best <- function(state, outcome) {
    ##Inital Validation checks
    ##first validations before loading data for speed reasons: fail quickly!
    
    if(str_length(state) > 2) {    
        return ("invalid state");  
    }
    
    #valid outcomes
    conditionDF <- data.frame(condition = c("heart attack", "heart failure", "pneumonia"), colindex = c(11,17,23));
    conditionFilter <-conditionDF$condition == tolower(outcome);
    
    conditionCheck <- conditionDF[conditionFilter,];
    
    if(nrow(conditionCheck) == 0) {
        
       return ("invalid outcome") 
    }
    
    
    #read data and initialize variables
    outcomeData <- read.csv("outcome-of-care-measures.csv", colClasses = "character");
    
    
    
    
    filter <-outcomeData$State == toupper(state);
    curstate <-outcomeData[filter,];
    
    #state validation num 2
    if(nrow(curstate) == 0) {
        
        return ("invalid state");
    }
    
    
    
    bestrate <- min(curstate[,conditionCheck$colindex]);
    
    filter <- curstate[,conditionCheck$colindex] == bestrate;
    
    best <- curstate[filter,2];
    
    #curstate[11 = min(curstate[,11]),3];
    
    #outcomeData[, 11] <- as.numeric(outcome[, 11]);
    ## You may get a warning about NAs being introduced; that is okay
    #hist(outcome[, 11]);
    
    #col 11 = 30 day mortality rate Heart Attack
    #col 17 = 30 day mortality rate Heart Failure
    #col 23 = 30 day mortality rate pneumonia
    #Hospital.Name is name (col 3)
    
}

check <- best("BB", "Heart Attack");
check <- best("Georgia", "Heart Attack");
check <- best("LA", "Heart Atta");

check <- best("LA", "Heart Attack");
check <- best("GA", "heart attack");
check <- best("Ky", "PneUmoNiA");  # this is a tie!  Use to test
