# Statistical Analysis of the Most Profitable Hollywood Movies from 2007 to 2011 using R

## Dataset description:
| Variables          | Description                                              | 
| ------------------ |:--------------------------------------------------------:| 
| Film               | 69 films                                                 | 
| Genre              | Comedy/Drama/Romance/Animation/Action/Fantacy            |   
| Studios            | Disney/Warner Bros/Universal/Fox/Summit/Independent films|  
| Worldwide Gross    | In millions of dollars                                   |
| Audience Score     | 0-100                                                    |
| Rotten Tomato Score| Disney/Warner Bros/Universal/Fox/Summit/Independent films|
| Year               | 2007-2011                                                |

## Quick glance:
| Measure    | Audience Score| Rotten tomato Score| Worldwide Gross|
| ---------- |:-------------:| :-----------------:| :-------------:|
| Min        | 35            | 3                  | 0.025          |
| Mean       | 64.46         | 47.88              | 142.6          |
| Median     | 65            | 46                 | 79.18          |
| Max        | 89            | 96                 | 709.8          |

## Missing values:
There were 74 records in total. 5 rows with missing columns are omitted for analysis
## Data Exploration:

## Primilinary Findings:
+ Comedy genre has the highest number of movies between 2007-2011, which is followed by Drama & Romance. These three are the top winners in total worldwide gross income
+ Drama is the most profitable genre from 2007-2011 which is followed by romance and comedy.
+ We can also infer that because Comedy, Drama, Romance are the most profitable, producers are more likely to produce these types of movies
+ Avg audience score for Drama , Comedy, Romance are similar. Although Fantasy receives the highest avg score, it has the least number of movies.
+ Avg scores between Audience and Rotten Tomato are very different. Avg Scores provided by Rotten Tomato are lower than that of Audience. However, both produce almost the same ranking for the five types of movies.

![](https://github.com/nkdot/statistics/blob/main/images/p1.png) ![](https://github.com/nkdot/statistics/blob/main/images/p2.png)


![](https://github.com/nkdot/statistics/blob/main/images/p3.png) ![](https://github.com/nkdot/statistics/blob/main/images/p4.png)


![](https://github.com/nkdot/statistics/blob/main/images/p5.png) ![](https://github.com/nkdot/statistics/blob/main/images/p6.png)

+ The highest number of most profitable movies produced in the year 2008 and the world wide gross income is also the highest in the year 2008.
+ 2010 is not the best year compared to the year 2008
  + Produced almost the same number of movies as in 2008
  + Total worldwide gross is very low
  + Avg profitability is the lowest
  + Avg worldwide gross is the lowest
  + Reviews scores are the lowest

## Hypothesis testing:
### F test:
 Hypothesis: 
 H0: variance of rotten tomato & audience scores are equal
 Ha: Variance of rotten tomato & audeince scores are not equal
 
 Rejection rule: Reject H0 if F>=F(alpha/2) or if p-value<=alpha
 
 Testing: 
 
 alpha=0.05
 
 p-value=2.709742e-07; F=3.643457; F(alpha/2)=1.615055
 
 p<alpha 
         
 Hence we reject H0. Variance of two scores are not equal.
 
 ### Mean of differences(Unpaired test):
         
 Two tailed test:
         
 Hypothesis:
         
 H0: The mean population score is same for audience and rotten tomato
         
 Ha: The mean population score is different for audience and rotten tomato
  
 Null is rejected. Hence audience score mean & rotten tomato scores are different.
 
 ### Observation:
         
 Audience Score is easy grader than Rotten Tomato Score. For the same movie, Audience Score would give higher ratings than Rotten Tomato. Furthermore,  since the standard deviation of audience score is much less than that of Rotten Tomato Score, we can state that Audience Score is generally more consistent (Less Variation) than Rotten Tomato Score. We guess it could partially due to Rotten Tomato falls short of standardized rating system.
         
## Relationship between Ratings & Worldwide Gross (Simple Linear Regression):
![](https://github.com/nkdot/statistics/blob/main/images/Picture3.png) ![](https://github.com/nkdot/statistics/blob/main/images/Picture4.png)
         
  Adjusted R-squared=0.1443, which means that only 14% of variation in worldwide gross can be explained using Audience score.

 ## Recommendation:
+ Choose a movie not solely based on one factor. 
+ Critic score & Worldwide gross are not best indicators to choose a film  
+ Audience Score is relatively better indicator 
+ Watch: Wall-E or Tangled : Audience Rating: 90/100 (Grossed over $350 mil)


         
## Limitations and possible future research:
The data set “Hollywood’s most profitable stories” had access to limited information. There are many other factors which may be influential in making a movie more successful in terms of worldwide gross and popularity. Some of the marketing strategies are identified and discussed below.
         
+	Effect of actors in the movie:
         
Though it may be difficult to draw conclusions about the direction of causality, for some movies it is possible to say that the involvement of star actors is critical to the success of those movies. The stronger a cast already is, the greater the impact of a newly recruited star with a track record of box office successes or with a strong artistic reputation [1].
 
+ Effect of title of the movie:
         
For instance, when the movie “Tangled” was first put into production, the film was promoted as having the title Rapunzel Unbraided, which was later changed to Rapunzel. To market the film to both sexes and additional age groups, Disney changed the film's name from Rapunzel to Tangled while also emphasizing Flynn Rider, the film's prominent male character, showing that his story is just as important as Rapunzel’s [2].
 
+ Movie plot and connecting with large audience:
         
Movie plot with less controversial theme and its ability to connect with a large audience play a major role in successful movies. For instance, if the movie plot belongs to a small demographic/ ethnic group and unable to connect with a large audience, the movie may not become successful.
 
+ Proportion of viewers who read or write reviews on the internet for the movies that they watch:
         
Reviewer score play a major role in attracting the audience to watch a movie. If a group of people control the rating of any movie, it may distort the reviewer score rating. Also, some reviewers may be biased against genre, actor or the film maker.  Hence it is important to know the proportion of viewers who read or write reviews on the internet for the movies that they watch.
 
+ List of unsuccessful movies with similar information as given in the data set “Hollywood’s most profitable stories”:
         
Data on unsuccessful movie may shed some light on the effect of audience & rotten tomatoes rating in successful & unsuccessful movies. 

Reference

Dataset: 
https://public.tableau.com/en-us/s/resources?qt-overview_resources=1#qt-overview_resources

Actor Effect 
[1] http://www.people.hbs.edu/aelberse/papers/hbs_06-002.pdf
 
Title Effect	
[2] https://www.latimes.com/archives/la-xpm-2010-mar-09-la-fi-ct-disney9-2010mar09-story.html
