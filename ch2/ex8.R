# Total Private Employed ----

tpe <- us_employment |> filter(Title == "Total Private")

tpe |> autoplot()
# Steady increasing linear trend. 2008 recession is obvious. Other recessions 
# visible but less prominent. Annual seasonal effect visible.
tpe |> gg_season()
# Seasonality looks to be a gradual increase throughout the year, from Jan
# to Dec.
tpe |> gg_subseries()
# Confirms linear trend, also seasonality pattern. 2008 effect clearly visible
# in all months' series. Other recessions appear as little blips.
tpe |> gg_lag()
# Typical strong linear trend lag plot: nothing new.
tpe |> ACF(Employed) |> autoplot()
# Standard strong linear trend ACF. Seasonal wave barely visible.

# Bricks ----

bricks <- aus_production |> 
  select(Bricks)

bricks |> autoplot()
# Linear increasing trend from 1960 to 1980 but then declining.
# Some kind of annual seasonality, but hard to make out.
bricks |> gg_season()
# Seasonality still not super obvious. Annual peak tends to be in Q2 or Q3.
bricks |> gg_subseries()
# Confirms previous observation about seasonality.
# 1975, 1983, 1992, 2001 were all obviously bad years.
bricks |> gg_lag(geom = "point", size = 0.4)
# Strong correlation for lags up to about 5 in all quarters.
bricks |> ACF(Bricks) |> autoplot()
# ACF gradually decreasing but shows strong influence of trend.
# Seasonal fluctuations very apparent.

# Hare pelts ----

hare <- pelt |> select(Hare)

hare |> autoplot()
# Trend is pretty flat looking. Some cyclicality, though hard to determine.
# Seasonality of >1yr, so skipping seasonal plots
hare |> gg_lag(geom = "point", size = 0.5)
# Decent positive correlation for lag 1 but beyond that it looks pretty noisy.
hare |> ACF(Hare) |> autoplot()
# Lag 1 has positive correlation of around 0.6. 
# There is a roughly ten year cycle.

# H02 cost ----

cortico <- PBS |> filter(ATC2 == "H02")

cortico |> autoplot()
# Linear increasing trend for concessional co-payments. Seasonal peaks
# increasing for concessional safety net. General series have pretty flat 
# trend. Clear annual seasonality, peaking at the end of the year.
cortico |> gg_season()
# Very revealing of different seasonal behaviour in different groups!
cortico |> gg_subseries()
# This makes the different trends appear much more clearly

# Barrels ----

barrels <- us_gasoline |> select(Barrels)

barrels |> autoplot()
# Noisier than previous series. Clear upward trend until 2008.
# Perhaps annual seasonality?
barrels |> gg_season()
# Trend is as above. No clear seasonal pattern as series are very noisy.
barrels |> gg_subseries()
# Hard to see much as data is weekly. Looks like seasonal peaks are in summer.
# Linear increasing trend is clear, though a dip around 2008.
barrels |> gg_lag(geom = "point", size = 0.3)
# Strong positive correlations with lags up to 9. Trend is driving this series.
barrels |> ACF(Barrels) |> autoplot()
# Confirms the above.