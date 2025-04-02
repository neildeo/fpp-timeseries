canadian_gas |> autoplot()
canadian_gas |> gg_season()
canadian_gas |> gg_subseries()

canadian_gas |> 
  model(
    STL(Volume ~ trend(window = 24) + season(window = 10))
  ) |>
  components() |> 
  autoplot()
