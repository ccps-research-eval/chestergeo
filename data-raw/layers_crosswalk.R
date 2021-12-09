
#get layers crosswalk
services <- extract_resources()

layers_crosswalk <- map_dfr(services, ~make_layers_crosswalk(.x))

save(layers_crosswalk, file = here::here("data/layers_crosswalk.RData"))

#get available layers
available_layers <- layers_crosswalk$layer

save(available_layers, file = here::here("data/available_layers.RData"))
