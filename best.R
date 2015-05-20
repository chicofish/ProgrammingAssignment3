setwd("~/Documents/DataScience/RProgramming/hospitaldata");
library("stringr", lib.loc="/Library/Frameworks/R.framework/Versions/3.1/Resources/library");

## Windows
#setwd("C:/Users/evp9/Desktop/Coursera/RProgramming/ProgrammingAssignment3")
#library("stringr");

#read data and initialize variables
outcomeData <- read.csv("outcome-of-care-measures.csv", colClasses = "character", na.strings = "Not Available");

#col 11 = 30 day mortality rate Heart Attack
#col 17 = 30 day mortality rate Heart Failure
#col 23 = 30 day mortality rate pneumonia
#Hospital.Name is name (col 2)


outcomeData[,11] <- as.numeric(outcomeData[,11]);
outcomeData[,17] <- as.numeric(outcomeData[,17]);
outcomeData[,23] <- as.numeric(outcomeData[,23]);


best <- function(state, outcome) {
    ##Inital Validation checks
    ##first validations before loading data for speed reasons: fail quickly!
    
    if(str_length(state) > 2) {    
        stop ("invalid state");  
    }
    
    ##valid outcomes
    conditionDF <- data.frame(condition = c("heart attack", "heart failure", "pneumonia"), colindex = c(11,17,23));
    conditionFilter <-conditionDF$condition == tolower(outcome);
    
    conditionCheck <- conditionDF[conditionFilter,];
    
    if(nrow(conditionCheck) == 0) {
        
       stop ("invalid outcome") 
    }
    
    
    filter <-outcomeData$State == toupper(state);
    curstate <-outcomeData[filter,]
    
    ##state validation num 2 
    if(nrow(curstate) == 0) {
        stop ("invalid state");
    }
    
   
    
    filter <- !is.na(curstate[,conditionCheck$colindex]);
    curstate <- curstate[filter,];
    
    
    bestrate <- min(curstate[,conditionCheck$colindex], na.rm=TRUE);
    
    filter <- curstate[,conditionCheck$colindex] == bestrate;
    
    best <- curstate[filter,2];
    
    
    ## Now I need to handle ties
    
    if(class(best)== "character") {
        
        return(best)
        
    }
    
    
    
}
