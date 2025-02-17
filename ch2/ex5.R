tourism_tbl <- readxl::read_excel("ch2/tourism.xlsx") |> 
  mutate(Quarter = yearquarter(Quarter))

tourism_ts <- tourism_tbl |> 
  as_tsibble(key = c(Region, State, Purpose), index = Quarter)

tourism_tbl |> summarise(TotalTrips = sum(Trips), .by = c(Region, Purpose)) |>
  dplyr::filter(TotalTrips == max(TotalTrips))

state_ts <- tourism_tbl |> 
  summarise(Trips = sum(Trips), .by = c(Quarter, State)) |> 
  mutate(Quarter = yearquarter(Quarter)) |> 
  as_tsibble(key = State, index = Quarter)
