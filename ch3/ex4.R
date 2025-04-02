source("ch2/ex7.R")

myseries |> autoplot()

lambda <- myseries |> 
  features(Turnover, features = guerrero) |> 
  pull(lambda_guerrero)

# Lambda is around 0.46

myseries |> autoplot(box_cox(Turnover, lambda))

# This works pretty well.