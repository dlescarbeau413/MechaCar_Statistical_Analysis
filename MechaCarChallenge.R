#Deliverable 1

#Use the library() function to load the dplyr package.
library(dplyr)

#Import and read in the MechaCar_mpg.csv file as a dataframe.

mechacar_data <- read.csv('MechaCar_mpg.csv',check.names=F,stringsAsFactors=F)

#Perform linear regression using the lm() function. In the lm() function, pass in all six variables (i.e., columns), and add the dataframe you created in Step 4 as the data parameter.

lm(mpg ~ vehicle_length + spoiler_angle + ground_clearance + AWD,data=mechacar_data)

#Using the summary() function, determine the p-value and the r-squared value for the linear regression model.
summary(lm(mpg ~ vehicle_length + spoiler_angle + ground_clearance + AWD,data=mechacar_data))


#Deliverable 2

#import and read in the Suspension_Coil.csv file as a table.
suspension_data <- read.csv('Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

#creates a total_summary dataframe using the summarize() function to get the mean, median, variance, and standard deviation of the suspension coil’s PSI column
total_summary <- suspension_data %>% summarize(Mean_PSI=mean(PSI),Median_PSI=median(PSI),Variance_PSI=var(PSI),STD_PSI=sd(PSI),Num_Vehicles=n(), .groups='keep')

#creates a lot_summary dataframe using the group_by() and the summarize() functions to group each manufacturing lot by the mean, median, variance, and standard deviation of the suspension coil’s PSI column
lot_summary <- suspension_data %>% group_by(Manufacturing_Lot) %>%summarize(Mean=mean(PSI),Median=median(PSI),Vaiance=var(PSI),STD=sd(PSI), .groups='keep')

#Deliverable 3

#using the t.test() function to determine if the PSI across all manufacturing lots is statistically different from the population mean of 1,500 pounds per square inch.

t.test(suspension_data$PSI,mu=1500)

#write three more RScripts using the t.test() function and its subset() argument to determine if the PSI for each manufacturing lot is statistically different from the population mean of 1,500 pounds per square inch.

lot_1 <-subset(suspension_data, Manufacturing_Lot == 'Lot1')
lot_2 <-subset(suspension_data, Manufacturing_Lot =='Lot2')
lot_3 <-subset(suspension_data, Manufacturing_Lot =='Lot3')

t.test(lot_1$PSI,mu=1500)

t.test(lot_2$PSI,mu=1500)

t.test(lot_3$PSI,mu=1500)