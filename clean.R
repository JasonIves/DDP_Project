#Source: U.S. Census Bureau, Current Population Survey, 2014 Annual Social and Economic Supplement
#Data are based on the CPS ASEC sample of 68,000 addresses, see footnote.
#Numbers are in thousands. Households as of March of the following year. A.O.I.C. stands for alone or in combination. Median income is calculated using $2,500 income intervals. The Gini index is calculated using micro-sorted data.  Medians falling in the upper open-ended interval are plugged with "$250,000".  Standard errors calculated using replicate weights)

setwd("~/Data Science Specialization/Dev Data Products/Project")

rawData <- read.csv("2013RawIncome.csv", sep = ",", strip.white = TRUE, stringsAsFactors = FALSE)

datarows <- c(9, 13:16, 20:32, 36:44, 48:56, 61:67, 72:77, 82:92, 
              96:106, 110:112)
datacols <- c(1:44, 46)
catrows <- c(10, 17, 33, 45, 58, 69, 79, 93, 107)

cols <- as.character(rawData[7,datacols])
cats <- as.character(rawData[catrows,1])

clnData <- as.data.frame(rawData[datarows, datacols])
colnames(clnData) <- cols

clnData$Category <- "ALL RACES"  ##ALL RACES
clnData$Category[2:5] <- cats[1]  ##TYPE OF RESIDENCE
clnData$Category[6:18] <- cats[2]  ##REGION/DIVISIONS
clnData$Category[19:27] <- cats[3]  ##TYPE OF HOUSEHOLD
clnData$Category[28:36] <- cats[4]  ##AGE OF HOUSEHOLDER
clnData$Category[37:43] <- cats[5]  ##SIZE OF HOUSEHOLD
clnData$Category[44:49] <- cats[6]  ##NUMBER OF EARNERS
clnData$Category[50:60] <- cats[7]  ##WORK EXPERIENCE OF HOUSEHOLDER
clnData$Category[61:71] <- cats[8]  ##EDUCATIONAL ATTAINMENT OF HOUSEHOLDER
clnData$Category[72:74] <- cats[9]  ##TENURE

clnData$Category <- gsub("^[\\.\\s]*", "", clnData$Category)
clnData$Characteristic <- gsub("^[\\.\\s]*", "", clnData$Characteristic)
clnData$Characteristic[5] <- gsub(" \\(4\\)$", "", clnData$Characteristic[5])
clnData$Characteristic <- gsub("\\(includes equivalency\\)", "or equivalent", clnData$Characteristic)
clnData$Characteristic[25] <- paste0(clnData$Characteristic[24], " - ", clnData$Characteristic[25])
clnData$Characteristic[27] <- paste0(clnData$Characteristic[26], " - ", clnData$Characteristic[27])
clnData$Characteristic[53:55] <- paste0("Full time jobs - ", clnData$Characteristic[53:55])
clnData$Characteristic[57:59] <- paste0("Part time jobs - ", clnData$Characteristic[57:59])
clnData <- clnData[c(ncol(clnData),1:ncol(clnData) - 1)]

for (i in 1:2) {
     clnData[,i] <- gsub(",", "", clnData[,i])
}

for (i in 3:ncol(clnData)) {
     clnData[,i] <- as.numeric(gsub(",", "", clnData[,i]))
}

for (i in 1:length(clnData$Category)) {
     clnData$Category[i] <- paste0(substring(clnData$Category[i],1,1), tolower(substring(clnData$Category[i],2,nchar(clnData$Category[i]))))
}

write.csv(clnData, file = "data/2013HHCharIncome.csv", row.names = FALSE)