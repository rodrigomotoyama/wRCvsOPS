library(tidyverse)

library(janitor)


left_path <- "data/Splits Leaderboard Data vs LHP.csv"

right_path <- "data/Splits Leaderboard Data vs RHP.csv"

data_left <- read_csv(left_path) %>% clean_names()

data_right <- read_csv(right_path) %>% clean_names()


data_left %>%
  slice_max(ops, n = 10)

data_left %>%
  filter(pa > 100) %>%
  # slice_max(pa, n = 10)
  slice_max(ops, n = 20)

data_left %>%
  ggplot() +
  geom_point(aes(x = ops, y = w_rc_2))
plotly::ggplotly()


PLOT <- data_left %>%
  filter(ops > 1 & w_rc_2 > 150) %>%
  ggplot(aes(x = ops, y = w_rc_2)) +
  geom_point(aes(color = name, size = pa, color = name))+
  geom_text(aes(label = name, size = 75))

data_left %>%
  filter(ops > 1 & w_rc_2 > 150) %>%
  ggplot(aes(x = ops, y = w_rc_2)) +
  geom_point(aes(color = name, size = pa, colour = name))+
  geom_text(aes(label = name, size = 90))+
  guides(colour="none", size = guide_legend(title="PA"))+
  ylab('wRC+')+
  xlab('OPS')

  plotly::ggplotly(PLOT)
