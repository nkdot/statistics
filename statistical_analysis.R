setwd("C:/Users/tempt/Downloads/Job/Projects")
df1<-read.csv("HollywoodsMostProfitableStories.csv", header=TRUE)
#remove 5 null values from the data
df2 <- na.omit(df1)
df3 <- df2[!(df2$Lead.Studio == ""), ] # remove empty value in Lead.Studio column
df3$Year<-as.factor(df3$Year) #change the Year type from integer to factor
df3$Audience..score..<-as.numeric(df3$Audience..score..)

##A) INFERENCE ABOUT TWO POPULATION VARIANCE- ##F-test
#H0: variance of rotten tomato & audience scores are equal
#Ha: Variance of rotten tomato & audeince scores are not equal
# Reject H0 if F>=F(alpha/2)
#or if p-value<=alpha
s1 <- sd(df3$Rotten.Tomatoes..)
n1 <- length(df3$Rotten.Tomatoes..)
s2 <- sd(df3$Audience..score..)
n2 <- length(df3$Audience..score..)
testF <- s1^2/s2^2 #Ensure this number is bigger than 1, else consider the reciprocal
testF
2*(1-pf(testF,n1-1,n2-1))
qf(0.975,n1-1,n2-1) #F(alpha/2)

#p-value(2.709742e-07)<0.05 (here alpha=0.05)
#F(3.643457)>F(alpha/2)1.615055
#Hence reject H0. Variance of two scores are not equal.

#### B) Mean of differnces(Unpaired test)
t.test(df3$Audience..score..,df3$Rotten.Tomatoes..,paired=TRUE)

##c)

df_c<- subset(df3, select = c(Film, Audience..score..,Worldwide.Gross) )

filmSLR <- lm(Worldwide.Gross ~ Audience..score.., data=df_c)
#a
coefficients(filmSLR)
#b
summary(filmSLR)$r.squared

#d
summary(filmSLR)
