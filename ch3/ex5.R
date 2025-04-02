# Tobacco ----

aus_production |> autoplot(Tobacco)

lambda <- aus_production |> 
  features(Tobacco, features = guerrero) |> 
  pull(lambda_guerrero)

aus_production |> autoplot(box_cox(Tobacco, lambda))

# lambda = 0.93, so not a major difference

# Economy passengers ----

economy <- 
  ansett |> 
  filter(Class == "Economy") |> 
  summarise(Passengers = sum(Passengers))

economy |> autoplot()

lambda <- economy |> 
  features(Passengers, features = guerrero) |> 
  pull(lambda_guerrero)

economy |> autoplot(box_cox(Passengers, lambda))

# lambda = 2 here, but this is majorly influenced by outliers such as the 
# grounding of planes during the late 80s industrial dispute.

economy |> autoplot(box_cox(Passengers, 0))

# The log transform looks more reasonable, but has obviously exacerbated the
# effect of the outlier observations. These should be dealt with in further
# analysis!

# Pedestrians ----

ped_ts <- pedestrian |> 
  filter(Sensor == "Southern Cross Station") |> 
  select(Count)

ped_ts |> autoplot()

# The variation actually looks pretty even so the predicted lambda should be
# close to 1.

lambda <- ped_ts |> 
  features(Count, features = guerrero) |> 
  pull(lambda_guerrero)

# Nonetheless, lambda is actually -0.25...

ped_ts |> autoplot(box_cox(Count, lambda))

# This does actually look way more even!