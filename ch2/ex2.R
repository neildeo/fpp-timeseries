gafa_stock |> 
  dplyr::filter(Close == max(Close), .by = Symbol)
