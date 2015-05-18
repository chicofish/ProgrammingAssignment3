setwd("~/Documents/DataScience/RProgramming/hospitaldata");

outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character");
head(outcome);
ncol(outcome);
nrow(outcome);
names(outcome);



filter <-outcome$State == "GA";
ga <-outcome[filter,];


outcome[, 11] <- as.numeric(outcome[, 11]);
## You may get a warning about NAs being introduced; that is okay
hist(outcome[, 11]);

#col 11 = 30 day mortality rate Heart Attack
#col 17 = 30 day mortality rate Heart Failure
#col 23 = 30 day mortality rate pneumonia