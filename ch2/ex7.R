set.seed(2121)

myseries <- aus_retail |> 
  filter(`Series ID` == sample(aus_retail$`Series ID`, 1))

myseries |> autoplot()

# Linear increasing trend
# Annual seasonality
# Seasonal variation increasing over time

myseries |> gg_season()

# Seasonal peak in December (presumably for Christmas)
# Dip in Feb, likely since it is a shorter month
# Mini peak in March, maybe due to Easter?
# Otherwise not much monthly variation

myseries |> gg_subseries()

# Makes linear trend very obvious, nothing much else interesting

myseries |> gg_lag()

# Strong trend means that lines are very close to y = x even at a lag of 9

myseries |> ACF(Turnover) |> autoplot()

# Again, strong linear trend means autocorrelation is close to 1 and
# gradually decreasing. Can see the slight wave pattern due to seasonal 
# effect.