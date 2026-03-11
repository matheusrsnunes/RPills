# Biblioteca e seed

library(tidyverse)
library(patchwork)

set.seed(0812)

# Personalização do estilo

source(file = "C:/Users/mths_/OneDrive/Documentos/RPills/PersonalizacaoGGplot2.R")

# Geração do Dataset semelhante ao livro

x <- seq(-3, 3, length.out = 30)
y <- x^2 + rnorm(30, sd = 0.5)

dados <- data.frame(Milhas = (x + 3.5) * 1000, Custo = y)
dados
dados$Custo <- dados$Custo + 2

# Reprodução em ggplot2

p1 <- dados %>% 
  ggplot(aes(x = Milhas, y = Custo)) +
  geom_point(size = 3,
             alpha = 0.8,
             color = "darkgrey") +
  scale_y_continuous(limits = c(0, 13)) +
  annotate("point",
           x = mean(dados$Milhas),
           y = mean(dados$Custo),
           size = 5,
           color = "#696969") +
  annotate("text",
           x = mean(dados$Milhas),
           y = mean(dados$Custo),
           label = "Média",
           vjust = -1.7,
           size = 10,
           color = "#696969") +
  labs(y = "Custo por milha (U$)",
       x = "Milhas dirigidas por mês")



# Parte 2

dados_plot2 <- dados %>% 
  mutate(Media_Custo = ifelse(Custo > mean(Custo), "Acima", "Abaixo"))

p2 <- dados_plot2 %>% 
  ggplot(aes(x = Milhas, y = Custo)) +
  geom_hline(yintercept = mean(dados$Custo),
             linetype = "dashed",
             size = 1.5,
             alpha = 0.8,
             color = "#696969") +
  geom_point(aes(color = Media_Custo, alpha = Media_Custo),
             size = 3) +
  scale_y_continuous(limits = c(0, 13)) +
  scale_color_manual(values = c("Acima" = "orange",
                                "Abaixo" = "darkgrey")) +
  scale_alpha_manual(values = c("Acima" = 1, "Abaixo" = 0.8)) +
  annotate("point",
           x = mean(dados$Milhas),
           y = mean(dados$Custo),
           size = 5,
           color = "#696969") +
  annotate("text",
           x = mean(dados$Milhas),
           y = mean(dados$Custo),
           label = "Média",
           vjust = -1.7,
           size = 10,
           color = "#696969") +
  labs(y = "Custo por milha (U$)",
       x = "Milhas dirigidas por mês") +
  theme(legend.position = "none")
  
  

# Salvar gráfico com layout 2x1

(p1 + p2) +
  plot_annotation(
    title = "Custo por milhas dirigidas",
    subtitle = "Comparação entre visualização básica e refinada"
  ) &
  theme(
    text = element_text(size = 24),
    plot.title = element_text(size = 48, face = "bold"),
    plot.subtitle = element_text(size = 36)
  )

ggsave("comparacao.png", width = 10, height = 5, dpi = 300)
