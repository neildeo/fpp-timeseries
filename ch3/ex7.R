gas <- tail(aus_production, 5 * 4) |> 
  select(Gas)

gas |> autoplot()

# Looks like a linearly increasing trend over time, with a clear annual 
# seasonality. Consumption peaks in winter (June).

gas_decomp <- 
  gas |> 
  model(
    classical_decomposition(Gas, type = "multiplicative")
  )

gas_decomp |> components() |> autoplot()

# The results clearly corroborate the observations from the time plot.

gas_decomp |> 
  components() |> 
  autoplot(season_adjust)

# Add an outlier in the middle of the series

gas1 <- gas
gas1$Gas[10] <- 600

gas1 |> 
  model(
    classical_decomposition(Gas, type = "multiplicative")
  ) |> 
  components() |> 
  autoplot(season_adjust)

# The outlier propagates through several points on the trend estimate and has 
# washed out the linear increasing trend.

# Below we move the outlier to the end of the series

gas2 <- gas
gas2$Gas[20] <- 600

gas2 |> 
  model(
    classical_decomposition(Gas, type = "multiplicative")
  ) |> 
  components() |> 
  autoplot(season_adjust)

# The effect is similar, just shifted along.