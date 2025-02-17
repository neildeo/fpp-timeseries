pigs <- aus_livestock |> filter(
  Animal == "Pigs",
  State == "Victoria",
  year(Month) %in% 1990:1995
)

pigs |> autoplot()
pigs |> ACF(Count) |> autoplot()

# Clearly differs from white noise: autocorrelation for several lags is above
# the threshold. There is a clear linear upward trend in the data.

pigs_long <- aus_livestock |> 
  filter(
    Animal == "Pigs",
    State == "Victoria"
  )

pigs_long |> autoplot()
pigs_long |> ACF(Count) |> autoplot()

# Although the series looks flatter there is still an even strong lag
# correlation!
