library(tidyverse)
library(here)

d <- tibble(temperature = runif(n = 100, min = 0, max = 35),
            sales = temperature + rnorm(100, mean = 0, sd = 4),
            drownings = temperature + rnorm(100, mean = 0, sd = 4))

transparent_theme <- theme_classic() + 
  theme(axis.text = element_blank(),
        axis.ticks = element_blank(),
        axis.line = element_line(colour = "white"),
        axis.title = element_text(colour = "white"),
        plot.background = element_blank(),
        panel.background = element_blank())

ggplot(d, aes(sales, drownings)) +
  geom_point(colour = "steelblue") +
  labs(x = "Glassförsäljning",
       y = "Drunkningar") +
  transparent_theme

ggsave(here("img/glass_drunkning.png"), bg = "transparent",
       height = 4, width = 6)

ggplot(d, aes(temperature, sales)) +
  geom_point(colour = "firebrick2") +
  labs(x = "Temperatur",
       y = "Glassförsäljning") +
  transparent_theme

ggsave(here("img/temp_glass.png"), bg = "transparent",
       height = 4, width = 6)

ggplot(d, aes(temperature, drownings)) +
  geom_point(colour = "gold") +
  labs(x = "Temperatur",
       y = "Drunkningar") +
  transparent_theme

ggsave(here("img/temp_drunkning.png"), bg = "transparent",
       height = 4, width = 6)