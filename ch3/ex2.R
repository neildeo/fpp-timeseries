# USA GDP ----

global_economy |> 
  filter(Country == "United States") |> 
  select(GDP, Population) |> 
  autoplot()

# Need to normalise by population
global_economy |> 
  filter(Country == "United States") |> 
  mutate(GDPperCapita = GDP / Population) |> 
  select(GDPperCapita) |> 
  autoplot()

# No other transform needed: series is very smooth

# Cattle in Victoria

vic_cattle <- aus_livestock |> 
  filter(
    State == "Victoria",
    Animal == "Bulls, bullocks and steers"
  ) 

vic_cattle |> autoplot()

# This series is much more noisy. However, it does not necessarily look like
# a transform is strictly necessary... to confirm or disprove this, retrieve
# the Guerrero estimate for the Box-Cox parameter

lambda <- vic_cattle |> 
  features(Count, features = guerrero) |> 
  pull(lambda_guerrero)

# The value of lambda is approximately -0.45! This suggests a log transform is 
# appropriate.

vic_cattle |> 
  mutate(logCount = log(Count)) |> 
  select(logCount) |> 
  autoplot()

# Elec in Victoria ----

vic_elec |> 
  select(Demand) |> 
  autoplot()

# Really noisy, impossible to tell without using Guerrero

lambda <- vic_elec |> 
  features(Demand, features = guerrero) |> 
  pull(lambda_guerrero)

# Lambda is close to 0.1; we will just use the suggested value

vic_elec |> 
  autoplot(box_cox(Demand, lambda))

# We can see that now the mid-year peaks are the same height

# Australian gas ----

aus_production |> 
  autoplot(Gas)

# Clearly needs a transform as seasonal effect grows in amplitude as time 
# goes on

lambda <- aus_production |> 
  features(Gas, features = guerrero) |> 
  pull(lambda_guerrero)

aus_production |> 
  autoplot(box_cox(Gas, lambda))

# Much better: seasonal variations are about equal now