#MechaCar Challenge

#Deliverable 1

#Load libraries
library(dplyr)

#import dataset
mechacar_data <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

#perform linear regression
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechacar_data )

#generate summary
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechacar_data ))

#Results
#p-value: 5.35 x 10^-11
#multiple r-squared: 0.7149
#adjusted r-squared: 0.6825

#Deliverable 2

#import suspension coil data
sc_data <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

#create total summary df from suspension coil data
total_summary <- sc_data %>% summarize(meanPSI=mean(PSI), medianPSI=median(PSI), variancePSI=var(PSI), sdPSI=sd(PSI))
total_summary

#create lot summary df
lot_summary <- sc_data %>% group_by(Manufacturing_Lot) %>% summarize(meanPSI=mean(PSI), medianPSI=median(PSI), variancePSI=var(PSI), sdPSI=sd(PSI), .groups= 'keep')
lot_summary

#Deliverable 3

#t-test for difference in PSI across lots
# t-test
t.test(sc_data$PSI, mu=1500)


#Now compare with each lot
#first, filter
filter_lot1 <- subset(sc_data, Manufacturing_Lot == "Lot1")
filter_lot2 <- subset(sc_data, Manufacturing_Lot == "Lot2")
filter_lot3 <- subset(sc_data, Manufacturing_Lot == "Lot3")

#t-tests
t.test(filter_lot1$PSI,mu=1500)
t.test(filter_lot2$PSI,mu=1500)
t.test(filter_lot3$PSI,mu=1500)






