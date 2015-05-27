#setwd("~/Documents/DataScience/RProgramming/hospitaldata");
#library("stringr", lib.loc="/Library/Frameworks/R.framework/Versions/3.1/Resources/library");

## Windows
setwd("C:/Users/evp9/Desktop/Coursera/RProgramming/ProgrammingAssignment3")
library("stringr");
library("plyr");

#read data and initialize variables
outcomeData <- read.csv("outcome-of-care-measures.csv", colClasses = "character", na.strings = "Not Available");

#col 11 = 30 day mortality rate Heart Attack
#col 17 = 30 day mortality rate Heart Failure
#col 23 = 30 day mortality rate pneumonia
#Hospital.Name is name (col 2)


outcomeData[,11] <- as.numeric(outcomeData[,11]);
outcomeData[,17] <- as.numeric(outcomeData[,17]);
outcomeData[,23] <- as.numeric(outcomeData[,23]);

#testFrame <- data.frame("state" = "", "condition" ="", "value" = "", "hospital" = "", "tieFlag" = 0, stringsAsFactors = FALSE);



rankall <- function(outcome, num = "best") {
    ##Inital Validation checks
    ##first validations before loading data for speed reasons: fail quickly!
    
    
    
    
    if(class(num) == "character"){
        if(num != "best" && num != "worst") {
            stop ("invalid rank")
        }
    }
    
    ##test num as input
    else if((as.integer(num) <= 0 || is.na(as.integer(num)) || as.integer(num) != num)){
        stop ("invalid rank")
        
    }
    

    
    ##valid outcomes
    conditionDF <- data.frame(condition = c("heart attack", "heart failure", "pneumonia"), colindex = c(11,17,23));
    conditionFilter <-conditionDF$condition == tolower(outcome);
    
    conditionCheck <- conditionDF[conditionFilter,];
    
    if(nrow(conditionCheck) == 0) {
        
        stop ("invalid outcome") 
    }
    
    
    ## define results DF to hold results
    
    resultsDF <- data.frame();
    
    ## define function to return hospital of that rank 
    
    ## apply function to the outcome data, splitting by state (tapply)
    ## return results DF

    
    rankState <- function (curState, num = "best") {
        
        resultsDF[nrow(resultsDF) + 1, 1] <<- curState



    
        filter <-outcomeData$State == toupper(curState);
        curstate <-outcomeData[filter,]
        
        
        
        
        
        filter <- !is.na(curstate[,conditionCheck$colindex]);
        curstate <- curstate[filter,];
        

        
        ##num validation num 2 
        ## do the validation after filtering out the NAs
        if(num == "best") {
            num <- 1
        }
        
        if(num == "worst") {
            num <- nrow(curstate)
        }
        
        
        if(num > nrow(curstate) ) {
            resultsDF[nrow(resultsDF),2] <<- NA
        }
        
        # find best or worst quickly without full state ranking
        
        if(num == 1){
            
            ranked <- min(curstate[,conditionCheck$colindex], na.rm=TRUE);
            
            filter <- curstate[,conditionCheck$colindex] == ranked;
            
        }
        
        else if(num == nrow(curstate)){
            
            ranked <- max(curstate[,conditionCheck$colindex], na.rm=TRUE);
            filter <- curstate[,conditionCheck$colindex] == ranked;
            
        }
        
        else{
            ##  need to sort and rank the DF and filter on a 'ranking' column
            
            curstate$ranking <- 1;
            
            curstate <- arrange(curstate, curstate[,conditionCheck$colindex], Hospital.Name)
            
            #return(curstate)
            
            ### actually if the rows are sorted, we can use num as a row identifier and no need to rank.
            resultsDF[nrow(resultsDF),2] <<- curstate[num,2]
            return(curstate[num,2])
        }
        
        
        
        filter <- curstate[,conditionCheck$colindex] == ranked;
        
        rankedHospital <- curstate[filter,2];
        
        
        ## Now I need to handle ties
        
        if(length(rankedHospital)== 1) {
#             testFrame[nrow(testFrame)+1,1] <<- as.character(curState);
#             testFrame[nrow(testFrame),2] <<- outcome;
#             testFrame[nrow(testFrame),3] <<- ranked;
#             testFrame[nrow(testFrame),4] <<- rankedHospital;
#             testFrame[nrow(testFrame),5] <<- 0;
            
            #print(c(state, outcome, bestrate));
            
            resultsDF[nrow(resultsDF),2] <<- rankedHospital
            return(rankedHospital)
            
        }
        
        else {
            
            
            rankedHospital <- sort(rankedHospital, decreasing=FALSE);
#             for(i in as.list(rankedHospital)){
#                 testFrame[nrow(testFrame)+1,1] <<- as.character(curState);
#                 testFrame[nrow(testFrame),2] <<- as.character(outcome);
#                 testFrame[nrow(testFrame),3] <<- ranked;
#                 testFrame[nrow(testFrame),4] <<- i;
#                 testFrame[nrow(testFrame),5] <<- 1;
#                 
#             }
            
            resultsDF[nrow(resultsDF),2] <<- as.character(as.list(rankedHospital[[1]]))
            return(as.character(as.list(rankedHospital[[1]])));
            
            
        }
        
    }
    
    
    sl <- as.factor(outcomeData$State);
    stateAbbrev <- levels(sl);
    
    for(abbrev in stateAbbrev) {
        rankState(abbrev, num)

        
    }


    results <- data.frame("hospital" = resultsDF[,2], "state" = resultsDF[,1])

    return(results)
}
