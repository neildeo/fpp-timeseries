dgoog <- gafa_stock |> 
  filter(Symbol == "GOOG", year(Date) >= 2018) |> 
  mutate(trading_day = row_number()) |> 
  update_tsibble(index = trading_day, regular = TRUE) |> 
  mutate(diff = difference(Close))

# Necessary to re-index because the dates of trading days are irregularly 
# spaced, so we create a regular index to perform our analysis.

dgoog |> select(diff) |> autoplot()
dgoog |> select(diff) |> ACF(diff) |> autoplot()

# This does look a lot like white noise from the ACF: only one of over 20
# lags has autocorrelation outside of the 95% bands.