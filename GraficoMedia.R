library(tidyverse)
set.seed(0812)


# Geração do Dataset semelhante ao livro

x <- seq(-3, 3, length.out = 30)
y <- x^2 + rnorm(30, sd = 1.5)

dados <- data.frame(Milhas = (x + 3.5) * 1000, Custo = y)

# Visualização RBase

plot(
  dados$Milhas,
  dados$Custo,
  main = "Custo por milhas dirigidas",
  xlab = "Milhas dirigidas por mês",
  ylab = "Custo por milha ($)",
  pch = 16,
  cex = 1.3,
  col = "darkgrey"
)
points(
  x = mean(dados$Milhas),
  y = mean(dados$Custo),
  cex = 1.6,
  pch = 16
)
text(
  x = mean(dados$Milhas),
  y = mean(dados$Custo),
  labels = "Média",
  pos = 3,
  cex = 0.9,
  font = 2,
  offset = 0.6
)


# Reprodução em ggplot2

dados %>% 
  ggplot(aes(x = Milhas, y = Custo)) +
  geom_point()