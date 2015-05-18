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
names(check)
min(as.numeric(check[,23]));
