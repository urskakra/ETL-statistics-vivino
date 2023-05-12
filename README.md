# project-2-vivino-UK


### **Objective**

About wine consumption in Spain:

60% of Spanish population are wine drinkers.

70% of all wine consumed in Spain is Red.

Average price per liter consumed is < €6.

_Vintage_ = year when wine was produced.<br><br>

This led me to analyze Spanish red wines in budget price range, up to €13 per bottle.<br><br>

My interest was to know if:
- for an average consumer, there is a significant difference between ratings of vintages
- cusumer ratings confirm expert opinion on quality of vintages
- weather conditions confirm perceived quality (ratings)<br><br>


### **Methods**

I used a **_Vivino_** wine dataset, available on Kaggle.
For meteorogical analysis, I exported .csv datasets from Open-Meteo.

Both datasets were cleaned, and prepared for analysis.

The wine dataset included the most rated wines (+100 per vintage) for years 2016-2020, so I chose to work with those years only.

In this timeframe, I focused on top 3 wine regions with the most rated wines (+200 per region): 
- Rioja
- Ribera del Duero
- South Catalunya (Priorat + Terra Alta + Montsant + Cariñena + Tarragona)

Meteo datasets include weather information for town coordinates inside these 3 regions:
- Logrono (Rioja)
- Aranda de Duero (Ribera del Duero)
- Corbera D'Ebre (South Catalunya)<br><br>


### **Limitations**

- wine datatset from 2021, includes only wines that were in Vivino database at that moment
- dataset only includes budget wines, up to €13 per bottle
- only including red wines
- general analysis, comparing vintages across all wines, but not comparing vintages within the same wine brand
- general analysis, observing yearly weather conditions, even-though the weather could be affecting vineyards on seasonal,
or even daily, basis<br><br>


### **Understand**

**About vintage quality.**

Accoring to WineMag and Wine Spectator, vintage quality across Spain from the most recent decade is as follows:

* Standout vintages are widely considered to be 2010, **2016** and **2019**. 

* The 2011, 2012 and 2015 vintages are, in general, very good vintages, albeit warm ones that produced fuller, lustier, more saturated wines.

* That leaves 2013, 2014, **2017** and **2018** as years where the weather across much of Spain didn’t fully cooperate. The result was widespread inconsistency.

* **2020** is said to have had a hot and dry summer, which resulted in a lower yield of grapes but with excellent quality.<br><br>


Best rated vintages and brief historic weather conditions that influenced the wine production in those regions:

(vintage - WS score - weather)

_Rioja_

2016 - 91 - A warm year gave structured and balanced reds

2017 - 87 - Difficult growing season led to inconsistent wines

2018 - 89 - Cooler weather produced fresher wines; some inconsistencies

2019 - 92-95 - Stable conditions led to focused wines with aging potential

_Ribeira del Duero_

2016 - 93 - Ripe yet balanced, with structure and focus

2017 - 87 - Spring frost and summer drought produced thick wines, many tough

2018 - 90 - A cooler year delivered a fresher style of wines

2019 - 92-95 - Warm, dry season yielded healthy fruit and concentrated wines

_Priorat (South Catalunya)_

2016 - 94 - Structured, balanced reds with good aging potential

2017 - 91 - Warm, dry year; ripe, plush reds

2018 - 92 - Moderate temperatures led to fresh reds with good structure

2019 - 92-95 - A warm, dry year with healthy fruit; rich, balanced wines<br><br>


**About weather conditions.**

The weather in the vineyard during a given year will impact the health and quality of the fruit produced. 

In cooler, cloudier years, grapes won’t get as ripe as they might in warmer, sunnier years. But too much heat can lead to overly jammy flavours or unpleasantly high alcohol levels.
    
If there’s too much rain close to the harvest, the grapes might taste watery and dilute, but extreme drought can cause the vine to shut down.
    
In overly damp and humid years, grapes can suffer from rot. A harsh spring frost can wreak havoc with the yield of fruit that can be produced, and a hailstorm can destroy a healthy crop of grapes within minutes.<br><br>


### **Analysis**

* **Wine ratings across the 3 observed regions, for all years.**

The median rating in the boxplot is approximately the same across all 3 regions.
For Rioja wines, 50% of users (Q3+Q4) rated them between 3.7 and 4.2 - out of which the top 25% quartile Q4 rated them between 3.85 and 4.2
A narrower rating range is observed for Duero wines, with ratings Q1-Q4 between 3.4 and 4.1

![Changes in rating, according to price](/images/wine_ratings_region_box.png)

* **Rating distributon for all wines, all years.**

Mean and Median are almost exactly the same (3.7) and Mode is 3.8

![Average rating of all wines](/images/avg_rating_histogram.png)

* **Price and ratings appear to be correlated.**

_H0: Cheaper wines have lower ratings, compared to more expensive wines._

_H1: There is no significant difference in rating between cheaper and more expensive wines._

Correlation index of 0.48 shows a positive, moderately correlated relationship between rating and price.

![Correlation between ratings and price](/images/rating_price_lin_regression.png)

* **Does the same apply for high rated wines?**

If we only observe the high rated wines (rating > 4.0), the correlation between the price of the wine and its rating becomes almost negligible (0.1). This means it is possible to buy cheaper wines with good ratings above 4.0!

![Correlation between ratings and price, high rated wines](/images/rating_price_highrated.png)

* **Average ratings per vintage and per region.**

Looking at average ratings, it seems that across all years Catalunya wines are consistently rated lower, compared to Rioja and Ribera del Duero. It also appears 2017 to be the vintage with the highest ratings, and 2020 the vintage wirh the lowest ratings, across all 3 regions.

![Average ratings per vintage and region](/images/rating_vintage_region.png)

Acording to Wine Spectator, the best Spanish vintages from last decade are the 2016 and 2019. 
It also describes Rioja vintages of 2017 of inconsistent quality, due to tough weather.
Let's test.<br><br>

_H0: Year 2016 produced good vintages, and have the rating the same or above average of all ratings (3.7)_

_H1: Users didn't rate 2016 vintages as exceptional - ratings are below average (H1 < 3.7)._

z-test

alpha = 0.05

p_value = 0.52508675

At 0.95 significance level we don't have enough information to reject H0. <br><br>

_H0: Year 2019 produced good vintages, and have the rating the same or above average of all ratings (3.7)_

_H1: Users didn't rate 2019 vintages as exceptional - ratings are below average (H1 < 3.7)._

z-score

alpha = 0.05

p_value = 0.24348774

At 0.95 significance level we don't have enough information to reject H0. 

Based on Vivino user ratings, we cannot say that 2016 nor 2019 vintage were on average better, compared to other vintages.<br><br>

_H0: Year 2017 produced lower quality vintages in Rioja, and have the rating the same or below average of all ratings (3.7)_

_H1: Users didn't rate 2017 Rioja vintages as lower quality - ratings are above average (H1 > 3.7)._
    
z-score

alpha = 0.05

p_value = 0.01234265

Reject H0 at 0.95 significance level. Rioja ratings of 2017 vintages are above the average 3.7<br><br>

* **Do wines from most reviewed regions suggest they are of better quality?**

Rioja seems to be the most popular region by far (with 167244 reviews), followed by Ribera del Duero (56166 reviews).

_H0: Rioja and Ribera del Duero have the same quality / same rated wines._

_H1: There is a difference in ratings - one is better than the other._
    
t-score

alpha = 0.05

p_value = 0.50434291

At 0.95 significance level there is no reason to assume Rioja has better rated wines than Duero. Cannot reject H0.

Side note: Rioja wines are rated differently from Catalunya ones.

t-score

alpha = 0.05

p_value = 0.008697

Reject H0 at 0.95 significance level. Rioja wines are rated differently from Catalunya ones.<br><br>

* **Weather conditions vs. Vintage quality.**

Considering there was no significant difference in the ratings of Rioja and Duero wines, can we guess it was because weather conditions were similar, and produced good vintages between 2016-2020 in both regions?

_H0: Weather conditions were the same across Rioja and Ribera del Duero regions._

_H1: Weather conditions were not the same._
    
ANOVA test

alpha = 0.05

p_value_precipitation = 0.143532

p_value_temperature = 0.813278

Cannot reject H0. There is no reason to assume Rioja had different precipitation conditions than Duero.
Cannot reject H0. There is no reason to assume Rioja had different temperature conditions than Duero.<br><br>


### **Conclusion**

- Average rating for all 3 regions (Rioja, Ribera del Duero and South Catalunya) have similar ratings on average. Wines from Ribera del Duero seem to have a narrower rating range however.

- Overall, there is a moderate correlation between price and rating - the more you pay, the better the quality. However, looking only at higher ratings (above 4.0), this correlation becomes almost insignificant - meaning it is possible to buy cheaper wines with good ratings above 4.0!

- Across all years Catalunya wines seem to be consistently rated lower, compared to Rioja and Ribera del Duero. Also:
    - 2017 >> vintage with the highest ratings, across all 3 regions
    - 2020 >> vintage with the lowest ratings, across all 3 regions

- Acording to Wine Spectator, some of the best Spanish vintages from last decade are the 2016 and 2019. There seems to be no such distinction among the Vivino user ratings, compared to other vintages.

- Wine Spectator also describes Rioja vintages of 2017 of inconsistent quality, due to tough weather. However, among Vivino users, Rioja ratings of 2017 vintages are above average.

- No significant difference between Rioja and Ribera del Duero ratings was found. And there was also no significant difference in weather conditions between both regions in the years 2016-2020.

TO BE ON THE SAFE SIDE:

When in doubt about budget reds, choose Ribera del Duero from 2017.

And consider paying a few € more. :)<br><br>


### **Sources**

https://www.kaggle.com/datasets/joshuakalobbowles/vivino-wine-data?resource=download

https://open-meteo.com/en/docs/historical-weather-api

https://www.winemag.com/2021/04/22/best-spain-red-wine-vintage/

https://www.winespectator.com/vintage-charts/region/spain

https://www.wsetglobal.com/knowledge-centre/blog/2021/march/22/weather-wine-and-vintages/

https://comparemyjet.com/wine-index/






