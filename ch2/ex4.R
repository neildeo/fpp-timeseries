usgas <- USgas::us_total |> 
  as_tsibble(key = state, index = year)

usgas |> 
  dplyr::filter(state %in% c("Maine", "Vermont", "New Hampshire", "Massachusetts", "Connecticut", "Rhode Island")) |> 
  summarise(`New England Total` = sum(y)) |> 
  autoplot()
