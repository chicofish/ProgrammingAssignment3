setwd("C:/Users/evp9/Desktop/Coursera/RProgramming/ProgrammingAssignment3")
source("rankhospital.R");

check <- rankhospital("BB", "Heart Attack");
check <- rankhospital("Georgia", "Heart Attack");
check <- rankhospital("LA", "Heart Atta");
check <- rankhospital("LA", "heart attack", "middle")
check <- rankhospital("MA", "heart failure", -9)
check <- rankhospital("sd", "pneumonia", 4.5)
check <- rankhospital("ky", "pneumonia", 6587)

rankhospital("mn", "heart attack", 5000)
rankhospital("md", "heart attack", "worst")
rankhospital("TX", "heart failure", 4)
rankhospital("TX", "heart attack", "best")
rankhospital("TX", "heart failure", "best")
rankhospital("MD", "pneumonia", "best")
rankhospital("MD", "heart attack", "best")
rankhospital("BB", "Heart Atack", "best")

rankhospital("TX", "heart failure", 12)



as.integer(4.5)


check <- rankhospital("sd", "pneumonia", 4)
check <- rankhospital("tx", "heart failure", 4)

check <- rankhospital("LA", "heart attack", "best")
check <- rankhospital("LA", "heart attack", "worst")

check <- rankhospital("MD", "heart attack", "worst")


check <- rankhospital("LA", "Heart Attack");
check <- rankhospital("GA", "heart attack");
check <- rankhospital("Ky", "PneUmoNiA"); 


check <- rankhospital("TX", "Heart Attack");
check <- rankhospital("TX", "heart failure");
check <- rankhospital("MD", "heart attack");


check <- rankhospital("MD", "pneumonia")
check <- rankhospital("AL", "pneumonia")

check <- rankhospital("MA", "pneumonia")

names(check)
min(as.numeric(check[,23]));

sl <- as.factor(outcomeData$State);
stateAbbrev <- levels(sl);

for(abbrev in stateAbbrev) {
    rankhospital(abbrev, "heart attack", "worst");
    rankhospital(abbrev, "heart failure", "worst");
    rankhospital(abbrev, "pneumonia", "worst");
    
}

hold <- check

debug(rankhospital)
undebug(rankhospital)
