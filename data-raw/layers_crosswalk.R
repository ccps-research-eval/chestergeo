
services <- extract_resources()

layers_crosswalk <- map_dfr(services, ~make_layers_crosswalk(.x))

save(layers_crosswalk, file = here::here("data/layers_crosswalk.RData"))
