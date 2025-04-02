global_economy |> 
  mutate(GDPperCapita = GDP / Population) |> 
  select(GDPperCapita) |> 
  filter(
    Country %in% c(
      "United States", 
      "United Kingdom", 
      "Germany", 
      "France",
      "China",
      "India",
      "Japan",
      "Canada",
      "Norway",
      "Sweden"
      )
  ) |> 
  autoplot() +
  theme(legend.position = "bottom")

global_economy |> 
  mutate(GDPperCapita = GDP / Population) |> 
  select(GDPperCapita) |> 
  filter(
    GDPperCapita == max(GDPperCapita, na.rm = T),
    .by = Year
  ) |> 
  arrange(Year) |> 
  print(n = 100)
