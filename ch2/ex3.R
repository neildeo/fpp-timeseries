tute1 <- readr::read_csv("ch2/tute1.csv")
tute1 |> head()

tute_ts <- tute1 |> 
  mutate(Quarter = yearquarter(Quarter)) |> 
  as_tsibble(index = Quarter)

tute_ts |>
  pivot_longer(-Quarter) |> 
  ggplot(aes(x = Quarter, y = value, colour = name)) +
  geom_line() +
  facet_grid(name ~ ., scales = "free_y")

# Without facet_grid, the lines are all plotted on a single axes.