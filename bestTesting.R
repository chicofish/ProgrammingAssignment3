setwd("C:/Users/evp9/Desktop/Coursera/RProgramming/ProgrammingAssignment3")
library("plyr");
source("best.R");

check <- best("BB", "Heart Attack");
check <- best("Georgia", "Heart Attack");
check <- best("LA", "Heart Atta");

check <- best("LA", "Heart Attack");
check <- best("GA", "heart attack");
check <- best("Ky", "PneUmoNiA"); 


check <- best("TX", "Heart Attack");
check <- best("TX", "heart failure");
check <- best("MD", "heart attack");


check <- best("MD", "pneumonia")
check <- best("AL", "pneumonia")

names(check)
min(as.numeric(check[,23]));

sl <- as.factor(outcomeData$State);
stateAbbrev <- levels(sl);

for(abbrev in stateAbbrev) {
    best(abbrev, "heart attack");
    best(abbrev, "heart failure");
    best(abbrev, "pneumonia");
    
}

