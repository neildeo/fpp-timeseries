# Bricks from aus_production ----

?aus_production

# Bricks is a quarterly time series

aus_production |> 
  select(Bricks) |> 
  autoplot()

# Lynx from pelt ----

?pelt

# Lynx is a yearly time series

pelt |> 
  select(Lynx) |> 
  autoplot()

# Close from gafa_stock ----

?gafa_stock

gafa_stock |> 
  select(Close) |> 
  autoplot()

# These time series are irregular: there are only records for US trading days

# Demand from vic_elec ----

?vic_elec

# Demand is a half-hourly time series

vic_elec |> 
  select(Demand) |> 
  autoplot() +
    labs(
      title = "Demand for Electricity in Victoria"
    ) +
    ylab("Demand (GWh)")
