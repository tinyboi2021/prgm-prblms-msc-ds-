print("enter a year to check the year is leap year")
year<-as.numeric(readline())

if((year %% 4 == 0 && year %% 100 != 0) || (year %% 400 == 0)){
    print("the year is a leap year")
}else{
    print("the year is not a leap year")
}
