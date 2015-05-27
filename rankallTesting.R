#setwd("C:/Users/evp9/Desktop/Coursera/RProgramming/ProgrammingAssignment3")
source("rankall.R");

check <- rankall("BB", "Heart Attack");
check <- rankall("Georgia", "Heart Attack");
check <- rankall("LA", "Heart Atta");
check <- rankall("LA", "heart attack", "middle")
check <- rankall("MA", "heart failure", -9)
check <- rankall("sd", "pneumonia", 4.5)
check <- rankall("ky", "pneumonia", 6587)

rm(checking)
rm(check)

as.integer(4.5)

rankall("heart aack", "best")
rankall("heart attack", 100)

rankall("heart attack", "best")
head(rankall("heart attack", 20), 10)
tail(rankall("pneumonia", "worst"),3)
tail(rankall("heart failure"),10)

rankFilter <- rank(outcomeData[,11])
checking <- outcomeData[rankFilter, ]

check <- rankall("pneumonia", 4)
check <- rankall("heart attack", 4)
check <- rankall("heart failure", 4)

check <- rankall("tx", "heart failure", 4)

check <- rankall("heart attack", "best")
check <- rankall("heart attack", "worst")

check <- rankall("heart attack", "worst")


check <- rankall("LA", "Heart Attack");
check <- rankall("GA", "heart attack");
check <- rankall("Ky", "PneUmoNiA"); 


check <- rankall("TX", "Heart Attack");
check <- rankall("TX", "heart failure");
check <- rankall("MD", "heart attack");


check <- rankall("MD", "pneumonia")
check <- rankall("AL", "pneumonia")

check <- rankall("MA", "pneumonia")

names(check)
min(as.numeric(check[,23]));

sl <- as.factor(outcomeData$State);
stateAbbrev <- levels(sl);

for(abbrev in stateAbbrev) {
    rankall(abbrev, "heart attack", "worst");
    rankall(abbrev, "heart failure", "worst");
    rankall(abbrev, "pneumonia", "worst");
    
}

hold <- check
