# Instalando pacotes ------------------------------------------------------
install.packages("tidyverse")
install.packages("lubridate")

# Carregando pacotes ------------------------------------------------------
library(tidyverse)
library(lubridate)

# Carregando arquivo ----------------------------------------------------
netflix <- read_csv("NetflixViewingHistory.csv")
head(netflix)

# Ajustando formato da data ---------------------------------------------
parseia_data <- function(x) {
                              data <- dmy(x)
                              if(sum(is.na(data)) > 0) {
                                data <- mdy(x)
                              }
                              return(data)
                            }

# Manipulando os dados ----------------------------------------------------
netflix <- netflix %>%
                      mutate(
                        Date = parseia_data(Date),
                        mes = month(Date, label = TRUE),
                        ano = year(Date),
                        dia_sem = wday(Date, label = TRUE),
                        categoria = str_detect(Title, ": "),
                        categoria = ifelse(categoria, "Séries", "Filmes/Docs."),
                        mes_ano = Date,
                        programa = str_remove(Title, ":.*")
                      )
head(netflix)

day(netflix$mes_ano) <- 1

ex1 <- tibble(date = c("14/01/19", "20/09/20"),
              date2 = c("12/30/2019", "10/01/15"))

# Plot 1 ------------------------------------------------------------------

netflix %>% 
  count(mes_ano) %>% 
  ggplot(aes(x = mes_ano, y = n)) +
  geom_line() +
  #geom_smooth(se = FALSE, color = "#e50914") +
  labs(x = "Ano", y = "Frequência") +
  ggtitle("Frequência ao longo do tempo")

# Plot 2 ------------------------------------------------------------------

netflix %>% 
  count(mes, ano, categoria) %>% 
  group_by(mes, categoria) %>% 
  summarise(freq_media = mean(n)) %>% 
  mutate(freq_media = round(freq_media)) %>% 
  ggplot(aes(x = mes, y = freq_media, fill = categoria)) +
  geom_col() +
  labs(x = "Mês", y = "Frequência média")

# Plot 3 ------------------------------------------------------------------

netflix %>% 
  count(ano, categoria) %>% 
  ggplot(aes(x = ano, y = n, fill = categoria)) +
  geom_col() +
  labs(x = "Ano", y = "Frequência total", fill = "") +
  scale_x_continuous(breaks = min(netflix$ano):max(netflix$ano))

# Plot 4 ------------------------------------------------------------------

netflix %>% 
  count(dia_sem, categoria) %>% 
  ggplot(aes(x = dia_sem, y = n, fill = categoria)) +
  geom_col() +
  labs(x = "Dia da semana", y = "Frequência total", fill = "")

# Plot 5 ------------------------------------------------------------------

netflix %>% 
  filter(categoria  == "Séries") %>% 
  count(programa) %>%
  top_n(10, n) %>% 
  mutate(programa = fct_reorder(programa, n)) %>% 
  ggplot(aes(x = programa, y = n)) +
  geom_col(fill = "blue", color = "black") +
  geom_text(aes(label = n, y = n/2), color = "white") +
  labs(x = "Série", y = "Total de visualizações") +
  coord_flip()
