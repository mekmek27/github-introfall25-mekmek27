#The goal of this assignment Verify you can use Microsoft Copilot / GitHub Copilot Chat alongside RStudio 
#to accelerate—but not replace—your coding.

# ------------------------------
# 1) Paths & file I/O
# ------------------------------

# 1.1 Set working directories -------------------------------------------------
# EDIT THESE for your environment
traindir <- "~/Documents/Systems Programming fall 2025/Data/"
sourcedir <- "~/Documents/Systems Programming fall 2025/Source/"

stopifnot(dir.exists(traindir))
setwd(traindir)
message("Working directory set to: ", getwd())

# 1.3 Safe CSV read helper ----------------------------------------------------
safe_read <- function(file) {
  # Matches read.csv defaults from class, but robust NA handling
  read.csv(file, na.strings = c("", "NA", "N/A"," NA", "NA "), stringsAsFactors = FALSE)
}

# 1.4 Read the accident CSV ------------------------------------------------
totacts <- safe_read("Railroad_Equipment_Accident_Incident_Source_Data__Form_54__20250907.csv")
# ------------------------------

#Prompt 1:
#Copilot Filter the data to include only accidents that occurred between the years 2021 and 2024 and name the new dataframe totacts2124.
totacts2124 <- subset(totacts, YEAR >= 2021 & YEAR <= 2024)
#Did it work as intended? (Yes/No)
# No, there was no data in the table so wrong logic

#Promt 2: 
#Create a new column in the totacts2124 dataframe that sums TOTINJ + TOTKLD for each accident. Call the column CASINJ.
totacts2124$CASINJ <- totacts2124$TOTINJ + totacts2124$TOTKLD
#Did it work as intended? (Yes/No)
# No, the column was not created because there was no data in the table.

#Prompt 3:
#Convert the two-digit IYR year column to a four-digit year column. Call the new column YEAR.
totacts2124$YEAR <- ifelse(totacts2124$IYR >= 50, 1900 + totacts2124$IYR, 2000 + totacts2124$IYR)
#Did it work as intended? (Yes/No)
# No, nothing changed again because there was no data in the table.

#Prompt 4:
#What are the new dimensions of the dataframe totacts2124?
dim(totacts2124)
#Did it work as intended? (Yes/No)
# Yes, it returned the dimensions of the dataframe. However the dimensions are not as expected since it says 
# there are 0 observations.