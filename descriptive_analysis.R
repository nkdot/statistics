holly <- read.csv("HollywoodsMostProfitableStories.csv", header = TRUE)
head(holly)
View(holly)

#any(is.na(holly$Audience..score..))
#any(is.na(holly$Profitability))
#any(is.na(holly$Rotten.Tomatoes..))

#View(holly$Film)## No NA's
#View(holly$Genre)## No NA's
#View(holly$Lead.Studio) ## Row 39 
#View(holly$Audience..score..)## Row 51
#View(holly$Profitability)## Row 18, 42, 71
#View(holly$Rotten.Tomatoes..)## Row 51
#View(holly$Worldwide.Gross)## No NA's 
#View(holly$Year)## No NA's

##holly <- holly[!is.na(holly$Lead.Studio),]
holly <- holly[-c(39),]
holly <- na.omit(holly)

head(holly)
install.packages('reshape')
library(reshape)
##*****************Descriptive Statistics****************##

##***********By Studio***********##

#*****RevenueByStudio*****#
# Total Revenue by studio between 2007-2011
revByStudio_sum <- aggregate(holly$Worldwide.Gross, by = list(holly$Lead.Studio), FUN = sum)
names(revByStudio_sum) <- c("Studio", "Revenue (WW)")
revByStudio_sum[order(revByStudio_sum$`Revenue (WW)`, decreasing = TRUE),]
# Top in term of total revenue 
# 1.) Warner Bros.    2081.1919
# 2.) Disney          1977.5626
# 3.) Independent     1465.3926
# 4.) Summit          1242.2630
# 5.) Universal       1152.4252

# Top in term of # of films 
filmsByStudio_count <- aggregate(holly$Worldwide.Gross, by = list(holly$Lead.Studio), FUN = length)
names(filmsByStudio_count) <- c("Studio", "# of Films")
filmsByStudio_count[order(filmsByStudio_count$`# of Films`, decreasing = TRUE),]

# Highest number of films released 
# 1.) Independent     17
# 2.) Warner Bros.    12
# 3.) Disney          6
# 4.) Universal       6
# 5.) Fox             6

# Average revenue by studio
revByStudio_mean <- aggregate(holly$Worldwide.Gross, by = list(holly$Lead.Studio), FUN = mean)
names(revByStudio_mean) <- c("Studio", "Revenue (WW)")
revByStudio_mean[order(revByStudio_mean$`Revenue (WW)`, decreasing = TRUE),]

# Top in term of average revenue 
# 1.) Disney        329.59376
# 2.) Summit        248.45260
# 3.) Universal     192.07087
# 4.) Warner Bros.  173.43266
# 5.) Fox           120.42805

##*****CriticsRatingByStudio*****##
#https://www.rottentomatoes.com/help_desk/critics
criticRatingByStudio_mean <- aggregate(holly$Rotten.Tomatoes.., by = list(holly$Lead.Studio), FUN = mean)
names(criticRatingByStudio_mean) <- c("Studio",    "Avg Critic rating")
criticRatingByStudio_mean[order(criticRatingByStudio_mean$`Avg Critic rating`, decreasing = TRUE),]

# Top studios in term of average critics rating 
# 1.) Disney                73.66667
# 2.) The Weinstein Company 71.66667
# 3.) Universal             54.66667
# 4.) Sony                  52.00000
# 5.) Fox                   51.83333

#Avgerage Critics rating
oaAvgCrating <- mean(holly$Rotten.Tomatoes..)
oaAvgCrating

##*****AudienceRatingByStudio*****##
audienceRatingByStudio_mean <- aggregate(holly$Audience..score.., by = list(holly$Lead.Studio), FUN = mean)
names(audienceRatingByStudio_mean) <- c("Studio",    "Avg Audience rating")
audienceRatingByStudio_mean[order(audienceRatingByStudio_mean$`Avg Audience rating`, decreasing = TRUE),]
# Top studios in terms of average audience rating
# 1.) Disney                76.50000
# 2.) Summit                73.20000
# 3.) Sony                  69.50000
# 4.) Fox                   69.00000
# 5.) The Weinstein Company 68.66667
# 6.) Independent           64.35294
# 7.) Universal             62.50000

#Average Audience rating 
oaAvgArating <- mean(holly$Audience..score..)
oaAvgArating
# Difference between avgerage Audience & Critic ratings
oaAvgArating-oaAvgCrating

##*****GenreByStudio*****##
# What genre does a studio prefer?
##Cross-tabfor Genre By Studio
hollyMelt <- melt(holly, id=c("Lead.Studio","Genre"), measure=c("Genre"))
head(holly)
cast(hollyMelt,Lead.Studio ~ Genre, subset=variable=="Genre",
     margins = c("grand_row","grand_col"), length)

##*************Genre*************##

##*****RevenuByGenre*****##

# Total revenue by genre
revByGenre_sum <- aggregate(holly$Worldwide.Gross, by = list(holly$Genre), FUN = sum)
names(revByGenre_sum) <- c("Genre", "Revenue (WW)")
revByGenre_sum[order(revByGenre_sum$`Revenue (WW)`, decreasing = TRUE),]
#       Genre     Revenue (WW)
# 1.)   Comedy     5193.595
# 2.)  Romance     1912.801
# 3.)    Drama     1287.148
# 4.)Animation     1070.330
# 5.)  Fantasy     285.431
# 6.)   Action     93.400

# Total count by genre
revByGenre_count <- aggregate(holly$Worldwide.Gross, by = list(holly$Genre), FUN = length)
names(revByGenre_count) <- c("Genre", "Count")
revByGenre_count[order(revByGenre_count$Count, decreasing = TRUE),]
#         Genre   Count
# 1.)    Comedy    38
# 2.)     Drama    13
# 3.)   Romance    13
# 4.) Animation     3
# 5.)    Action     1
# 6.)   Fantasy     1

# Average revenue by genre
revByGenre_mean <- aggregate(holly$Worldwide.Gross, by = list(holly$Genre), FUN = mean)
names(revByGenre_mean) <- c("Genre", "Avg_Revenue (WW)")
revByGenre_mean[order(revByGenre_mean$`Avg_Revenue (WW)`, decreasing = TRUE),]
#         Genre       Revenue (WW)
# 1.) Animation        356.77681
# 2.)   Fantasy        285.43100
# 3.)   Romance        147.13857
# 4.)    Comedy        136.67354
# 5.)     Drama         99.01137
# 6.)    Action         93.40000

##*****CriticsRatingByGenre*****##
#https://www.rottentomatoes.com/help_desk/critics

criticRatingByGenre_mean <- aggregate(holly$Rotten.Tomatoes.., by = list(holly$Genre), FUN = mean)
names(criticRatingByGenre_mean) <- c("Genre",    "Avg Critic rating")
criticRatingByGenre_mean[order(criticRatingByGenre_mean$`Avg Critic rating`, decreasing = TRUE),]
#     Genre Avg       Critic rating
# 1.) Animation          80.33333
# 2.)   Fantasy          73.00000
# 3.)     Drama          51.53846
# 4.)   Romance          45.69231
# 5.)    Comedy          45.13158
# 6.)    Action          11.00000