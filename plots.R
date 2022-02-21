setwd("C:/Users/tempt/Downloads/Job/Projects")
df1<-read.csv("HollywoodsMostProfitableStories.csv", header=TRUE)

#Data Overview
library(pastecs)
stat.desc(df1)
typeof(df1$Year)
dim(df1)
summary(df1)

#remove 5 null values from the data
df2 <- na.omit(df1)
View(df2)
df3 <- df2[!(df2$Lead.Studio == ""), ] # remove empty value in Lead.Studio column
df3$Year<-as.factor(df3$Year) #change the Year type from integer to factor
typeof(df3$Year)
View(df3)
df3$Audience..score..<-as.numeric(df3$Audience..score..)
                #Final dataset
#data dimention
dim(df3)
#5 point summary
summary(df3)

#mean audience score by genre
chart1 <- aggregate(df3$Audience..score.., by = list(df3$Genre), FUN = mean)
names(chart1) <- c("Genre", "Avg_Audience_Score")
chart1<-as.data.frame(chart1)
chart1

barplot(chart1$Avg_Audience_Score, names.arg=chart1$Genre, 
        horiz=FALSE, las=0.6, cex.names=0.8, border=NA, 
        main="Average Audience Score by Genre 2007-2011",
        ylab="Avg Score", col=c("red","green","grey","blue","purple","orange"))

#mean audience score by studio
chart2 <- aggregate(df3$Audience..score.., by = list(df3$Lead.Studio), FUN = mean)
names(chart2) <- c("Studio", "Avg_Audience_Score")
chart2
chart2a<- subset(chart2,Studio=="Disney"|Studio=="Summit"|Studio=="Sony"|Studio=="Fox"|Studio=="The Weinstein Company")

barplot(chart2a$Avg_Audience_Score, names.arg=chart2a$Studio, 
        horiz=FALSE, las=0.3, cex.names=0.7, border=NA, width=0.2,
        main="Average Audience Score by Top Five Studio 2007-2011",
        ylab="Avg Score", col=c("red","green","grey","blue","purple"))

### mean audience score by year
chart3 <- aggregate(df3$Audience..score.., by = list(df3$Year), FUN = mean)
names(chart3) <- c("Year", "Avg_Audience_Score")
barplot(chart3$Avg_Audience_Score, names.arg=chart3$Year, 
        horiz=FALSE, las=0.3, cex.names=1, border=NA,
        main="Average Audience Score between 2007-2011",
        ylab="Avg Score", col=c("red","green","grey","blue","purple"))

### mean Rotten.Tomatoes. by genre
chart4 <- aggregate(df3$Rotten.Tomatoes.., by = list(df3$Genre), FUN = mean)
names(chart4) <- c("Genre", "Avg_Rotten_Tomatoes")
barplot(chart4$Avg_Rotten_Tomatoes, names.arg=chart4$Genre, 
        horiz=FALSE, las=0.6, cex.names=0.8, border=NA, 
        main="Avg Rotten Tomatoes by Genre 2007-2011",
        ylab="Avg Score", col=c("red","green","grey","blue","purple","orange"))

### mean Rotten.Tomatoes. by studio
chart5 <- aggregate(df3$Rotten.Tomatoes.., by = list(df3$Lead.Studio), FUN = mean)
names(chart5) <- c("Studio", "Avg_Rotten_Tomatoes")
chart5a<- subset(chart5,Studio=="Disney"|Studio=="Universal"|Studio=="Sony"|Studio=="Fox"|Studio=="The Weinstein Company")

barplot(chart5a$Avg_Rotten_Tomatoes, names.arg=chart5a$Studio, 
        horiz=FALSE, las=0.3, cex.names=0.7, border=NA, width=0.2,
        main="Five Studio with Avg Rotten Tomatoes Score 2007-2011",
        ylab="Avg Score", col=c("red","green","grey","purple","black"))

### mean Rotten.Tomatoes by year
chart6 <- aggregate(df3$Rotten.Tomatoes.., by = list(df3$Year), FUN = mean)
names(chart6) <- c("Year", "Avg_Rotten_Tomatoes")

barplot(chart6$Avg_Rotten_Tomatoes, names.arg=chart6$Year, 
        horiz=FALSE, las=0.3, cex.names=1, border=NA,
        main="Avg Rotten Tomatoes Score between 2007-2011",
        ylab="Avg Score", col=c("red","green","grey","blue","purple"))

### mean Worldwide.Gross by genre
chart7 <- aggregate(df3$Worldwide.Gross, by = list(df3$Genre), FUN = mean)
names(chart7) <- c("Genre", "Avg_Worldwide_Gross")

barplot(chart7$Avg_Worldwide_Gross, names.arg=chart7$Genre, 
        horiz=FALSE, las=0.6, cex.names=0.8, border=NA, 
        main="Avg Worldwide Gross by Genre 2007-2011",
        ylab="Avg_Worldwide_Gross in Million", col=c("red","green","grey","blue","purple","orange"))

### mean Worldwide.Gross by studio
chart8 <- aggregate(df3$Worldwide.Gross, by = list(df3$Lead.Studio), FUN = mean)
names(chart8) <- c("Studio", "Avg_Worldwide_Gross")
chart8a<- subset(chart8,Studio=="Disney"|Studio=="Summit"|Studio=="Universal"|Studio=="Fox"|Studio=="Warner Bros.")

barplot(chart8a$Avg_Worldwide_Gross, names.arg=chart8a$Studio, 
        horiz=FALSE, las=0.3, cex.names=0.9, border=NA, width=0.2,
        main="Five Studios with top Avg Worldwide Gross 2007-2011",
        ylab="Avg_Worldwide_Gross in Million", col=c("red","green","blue","black","pink"))

### mean Worldwide.Gross by year
chart9 <- aggregate(df3$Worldwide.Gross, by = list(df3$Year), FUN = mean)
names(chart9) <- c("Year", "Avg_Worldwide_Gross")

barplot(chart9$Avg_Worldwide_Gross, names.arg=chart9$Year, 
        horiz=FALSE, las=0.3, cex.names=1, border=NA,
        main="Avg Worldwide Gross between 2007-2011",
        ylab="Avg_Worldwide_Gross in Million", col=c("red","green","grey","blue","purple"))

### mean Profitability by genre
chart10 <- aggregate(df3$Profitability, by = list(df3$Genre), FUN = mean)
names(chart10) <- c("Genre", "Avg_Profitability")

barplot(chart10$Avg_Profitability, names.arg=chart10$Genre, 
        horiz=FALSE, las=0.6, cex.names=0.8, border=NA, 
        main="Avg Profitability by Genre 2007-2011",
        ylab="Avg Profitability", col=c("red","green","grey","blue","purple","orange"))

### mean Profitability by studio
chart11 <- aggregate(df3$Profitability, by = list(df3$Lead.Studio), FUN = mean)
names(chart11) <- c("Studio", "Avg_Profitability")
chart11a<- subset(chart11,Studio=="Disney"|Studio=="Summit"|Studio=="Independent"|Studio=="Fox"|Studio=="Sony")

barplot(chart11a$Avg_Profitability, names.arg=chart11a$Studio, 
        horiz=FALSE, las=0.3, cex.names=0.9, border=NA, width=0.2,
        main="Five Studios with top Avg Profitability 2007-2011",
        ylab="Avg Profitability", col=c("red","green","light blue","grey","blue"))

##
### mean Profitability by year
chart12 <- aggregate(df3$Profitability, by = list(df3$Year), FUN = mean)
names(chart12) <- c("Year", "Avg_Profitability")

barplot(chart12$Avg_Profitability, names.arg=chart12$Year, 
        horiz=FALSE, las=0.3, cex.names=1, border=NA,
        main="Avg Profitability between 2007-2011",
        ylab="Avg Profitability", col=c("red","green","grey","blue","purple"))

### how many movies in each type of genres 
chart13 <- aggregate(df3$Audience..score.., by = list(df3$Genre), FUN = length)
names(chart13) <- c("Genre", "No.of Movies")

barplot(chart13$`No.of Movies`, names.arg=chart13$Genre, 
        horiz=FALSE, las=0.6, cex.names=0.8, border=NA, 
        main="No.of Movies by Genre 2007-2011",
        ylab="No.of Movies", col=c("red","green","grey","blue","purple","orange"))

### how many movies in each year
chart14 <- aggregate(df3$Audience..score.., by = list(df3$Year), FUN = length)
names(chart14) <- c("Year", "No.of Movies")

barplot(chart14$`No.of Movies`, names.arg=chart14$Year, 
        horiz=FALSE, las=0.3, cex.names=1, border=NA,
        main="No.of Movies between 2007-2011",
        ylab="No.of Movies", col=c("red","green","grey","blue","purple"))

### how many movies in each studio
chart15<- aggregate(df3$Audience..score.., by = list(df3$Lead.Studio), FUN = length)
names(chart15) <- c("Studio", "No.of Movies")
chart15a<- subset(chart15,Studio=="Disney"|Studio=="Warner Bros."|Studio=="Independent"|Studio=="Fox"|Studio=="Universal")

barplot(chart15a$`No.of Movies`, names.arg=chart15a$Studio, 
        horiz=FALSE, las=0.3, cex.names=0.9, border=NA, width=0.2,
        main="Five Studios with No.of Movies 2007-2011",
        ylab="No.of Movies", col=c("red","green","light blue","black","pink"))

#Five Studios with Total World Grosss 2007-2011
chart16 <- aggregate(df3$Worldwide.Gross, by = list(df3$Lead.Studio), FUN = sum)
names(chart16) <- c("Studio", "World Gross")
chart16a<- subset(chart16,Studio=="Disney"|Studio=="Warner Bros."|Studio=="Independent"|Studio=="Summit"|Studio=="Universal")

barplot(chart16a$`World Gross`, names.arg=chart16a$Studio, 
        horiz=FALSE, las=0.3, cex.names=0.9, border=NA, width=0.2,
        main="Five Studios with Total World Grosss 2007-2011",
        ylab="Worldwide Revenue", col=c("red","light blue","dark green", "black","pink"))

#studio vs no of films made
chart17 <- aggregate(df3$Film, by = list(df3$Lead.Studio), FUN = length)
names(chart17) <- c("Studio", "Total Number of Films")

chart17a<- subset(chart17,Studio=="Disney"|Studio=="Warner Bros."|Studio=="Independent"|Studio=="Fox"|Studio=="Universal")

barplot(chart17a$`Total Number of Films`, names.arg=chart17a$Studio, 
        horiz=FALSE, las=0.3, cex.names=0.9, border=NA, width=0.2,
        main="Five Studios with Total Number of Films 2007-2011",
        ylab="Total Number of Films", col=c("red","green","light blue", "black","pink"))

# Total Worldwide Gross by Genre 2007-2011
chart18 <- aggregate(df3$Worldwide.Gross, by = list(df3$Genre), FUN = sum)
names(chart18) <- c("Genre", "World Gross")

barplot(chart18$`World Gross`, names.arg=chart18$Genre, 
        horiz=FALSE, las=0.6, cex.names=0.8, border=NA, 
        main="Total Worldwide Gross by Genre 2007-2011",
        ylab="Worldwide Gross", col=c("red","green","grey","blue","purple","orange"))

#Total Number of Films by Genre 2007-2011
chart19 <- aggregate(df3$Worldwide.Gross, by = list(df3$Genre), FUN = length)
names(chart19) <- c("Genre", "Total Number of Films")

barplot(chart19$`Total Number of Films`, names.arg=chart19$Genre, 
        horiz=FALSE, las=0.6, cex.names=0.8, border=NA, 
        main="Total Number of Films by Genre 2007-2011",
        ylab="Total Number of Films", col=c("red","green","grey","blue","purple","orange"))


#Total Worldwide Gross betwen 2007-2011
chart20 <- aggregate(df3$Worldwide.Gross, by = list(df3$Year), FUN = sum)
names(chart20) <- c("Year", "World Gross")

barplot(chart20$`World Gross`, names.arg=chart20$Year, 
        horiz=FALSE, las=0.3, cex.names=1, border=NA,
        main="Total Worldwide Gross betwen 2007-2011",
        ylab="Total Worldwide Gross", col=c("red","green","grey","blue","purple"))

#summary
summary(df3$Rotten.Tomatoes..)
summary(df3$Audience..score..)

df3_2007<-subset(df3, Year=="2007")
View(df3_2007)
df3_2008<-subset(df3, Year=="2008")
View(df3_2008)
df3_2009<-subset(df3, Year=="2009")
View(df3_2009)
df3_2010<-subset(df3, Year=="2010")
View(df3_2010)
df3_2011<-subset(df3, Year=="2011")
View(df3_2011)

### Correlation
cor(df3$Worldwide.Gross,df3$Audience..score..)
cor(df3$Worldwide.Gross,df3$Rotten.Tomatoes..)
cor(df3$Worldwide.Gross,df3$Profitability)

#### it is difficult to find the correlation between the reviews & profitability as our dataset is limited to most profitable movies and not the flop movies

#scatterplots
plot(df3$Worldwide.Gross ~ df3$Audience..score.., xlab = "Audience Score", ylab = "World Gross", main="Audience Score V.S World Gross")
plot(df3$Worldwide.Gross ~ df3$Rotten.Tomatoes.., xlab = "Rotten Tomatoes Score", ylab = "World Gross", main="Rotten Tomatoes Score V.S World Gross")
plot(df3$Worldwide.Gross ~ df3$Profitability, xlab = "Profitability", ylab = "World Gross", main="Profitability V.S World Gross")
plot(df3$Worldwide.Gross ~ df3$Year,  xlab = "Year",ylab = "World Gross", main="World Gross by Year")

