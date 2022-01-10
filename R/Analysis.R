library(tidyverse)

library(janitor)


left_path <- "R/data/Splits Leaderboard Data vs LHP.csv"

right_path <- "R/data/Splits Leaderboard Data vs RHP.csv"

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


PLOT <- data_right %>%
  filter(ops > 0.95 & w_rc_2 > 150) %>%
  ggplot(aes(x = ops, y = w_rc_2)) +
  geom_point(aes(color = name, size = pa, color = name))+
  geom_text(aes(label = name, size = 150))

plotly::ggplotly(PLOT)

data_left %>%
  filter(ops > 1 & w_rc_2 > 150) %>%
  ggplot(aes(x = ops, y = w_rc_2)) +
  geom_point(aes(color = name, size = pa, colour = name))+
  geom_text(aes(label = name, size = 90))+
  guides(colour="none", size = guide_legend(title="PA"))+
  ylab('wRC+')+
  xlab('OPS')

data_left %>%
  filter(name == 'Vladimir Guerrero Jr.')


  data_right %>%
    filter(ops > 1 & w_rc_2 > 150) %>%
    ggplot(aes(x = ops, y = w_rc_2)) +
    geom_point(aes(color = name, size = pa, colour = name))+
    geom_text(aes(label = name, size = 90))+
    guides(colour="none", size = guide_legend(title="PA"))+
    ylab('wRC+')+
    xlab('OPS')


  players_to_hide <- c('Mike Zunino',
                       'Luis Robert',
                       'Ketel Marte',
                       'Teoscar Hernandez',
                       'Trea Turner')
  data_left %>%
    # filter(ops > 1 & w_rc_2 > 150) %>%
    DT::datatable()
    # mutate(name = if_else('Mike Zunino' == name, 'Player 1', name),
    #        name = if_else('Luis Robert' == name, 'Player 2', name),
    #        name = if_else('Ketel Marte' == name, 'Player 3', name),
    #        name = if_else('Teoscar Hernandez' == name, 'Player 4', name),
    #        name = if_else('Trea Turner' == name, 'Player 5', name),
    # )

  data_left %>%
    # filter(ops > 1 & w_rc_2 > 150) %>%
    mutate(pa = if_else(pa>100, 0, 1))


  data_left$pa %>% median()

  data_right %>%
    # filter(ops > 1 & w_rc_2 > 150) %>%
    DT::datatable()
  data_left %>%
    filter(ops > 1 & w_rc_2 > 150) %>%
    mutate(name = if_else('Mike Zunino' == name, 'Player 1', name),
           name = if_else('Luis Robert' == name, 'Player 2', name),
           name = if_else('Ketel Marte' == name, 'Player 3', name),
           name = if_else('Teoscar Hernandez' == name, 'Player 4', name),
           name = if_else('Trea Turner' == name, 'Player 5', name),
    ) %>%
    ggplot(aes(x = ops, y = w_rc_2)) +
    geom_point(aes(color = name, size = pa, colour = name))+
    geom_text(aes(label = name, size = 90))+
    guides(colour="none", size = guide_legend(title="PA"))+
    ylab('wRC+')+
    xlab('OPS')






  data_right %>%
    filter(ops > 0.950 & w_rc_2 > 150) %>%
    mutate(name = if_else('Bryce Harper' == name, 'Player 1', name),
           name = if_else('Juan Soto' == name, 'Player 2', name),
           name = if_else('Jesse Winker' == name, 'Player 3', name),
           name = if_else('Joey Votto' == name, 'Player 4', name),
           name = if_else('Vladimir Guerrero Jr.' == name, 'Player 5', name),
    ) %>%
    ggplot(aes(x = ops, y = w_rc_2)) +
    geom_point(aes(color = name, size = pa, colour = name))+
    geom_text(aes(label = name, size = 200))+
    guides(colour="none", size = guide_legend(title="PA"))+
    ylab('wRC+')+
    xlab('OPS')











