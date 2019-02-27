library(maps)
library(maptools)
library(mapdata)
library(readr)
library(dplyr)
library(here)

spruce_data <- read_delim(here("data/spruce_trials.csv"), delim = ";")

world <- map_data("world")
ggplot(world, aes(x = long, y = lat, group = group)) +
  geom_polygon(fill = "white", colour = "gray") +
  coord_map("lambert", parameters = c(15, 60), xlim = c(5, 25), ylim = c(53, 72)) +
  geom_point(data = spruce_data, aes(x = `abs(longitude)`, y = latitude, group = country),
             fill = "forestgreen", pch = 21) +
  labs(x = "", y = "") +
  theme(plot.background = element_blank(),
        panel.background = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank())

ggsave(here("img/spruce_trials.png"), bg = "transparent",
       height = 5, width = 3, units = "in", dpi = 300)

pine_data <- read_delim(here("data/pine_trials.csv"), delim = ";")

ggplot(world, aes(x = long, y = lat, group = group)) +
  geom_polygon(fill = "white", colour = "gray") +
  coord_map("lambert", parameters = c(15, 60), xlim = c(5, 25), ylim = c(53, 72)) +
  geom_point(data = pine_data, aes(x = `abs(longitude)`, y = latitude, group = country),
             fill = "forestgreen", pch = 21) +
  labs(x = "", y = "") +
  theme(plot.background = element_blank(),
        panel.background = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank())

ggsave(here("img/pine_trials.png"), bg = "transparent",
       height = 5, width = 3, units = "in", dpi = 300)
