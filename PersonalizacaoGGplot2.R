# tema_meu_estilo.R
library(ggplot2)
library(showtext)

font_add_google("Inter", "Inter")
showtext_auto()

theme_meu_estilo <- function() {
  theme_minimal(base_family = "Inter") %+replace% 
    theme(
      plot.title = element_text(size = 24, face = "bold", hjust = 0.5),
      plot.subtitle = element_text(size = 16, hjust = 0.5, margin = margin(b = 20)),
      axis.line.x = element_line(size = 0.8),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      plot.margin = unit(c(1, 1, 1, 1), "cm"),
      legend.position = "bottom",
      axis.line.y = element_line(size = 0.8)
    )
}

# Define como padrão
theme_set(theme_meu_estilo())
update_geom_defaults("text", list(family = "Inter"))
update_geom_defaults("label", list(family = "Inter"))

# Cores

