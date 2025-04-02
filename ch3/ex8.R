source("ch2/ex7.R")

myseries |> autoplot()

x11_decomp <- myseries |> 
  model(
    x11 = X_13ARIMA_SEATS(Turnover ~ x11())
  ) |> 
  components() |> 
  autoplot()

# The X13 binary doesn't work so we can't do this...