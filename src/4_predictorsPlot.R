# plotting final graph for strongest predictors
# Usage: Rscript 4_predictorsPlot.R "../results/DecisionTree_important_features.csv" "../results"

suppressPackageStartupMessages(library(tidyverse))

args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
output_file <- args[2]

pokemon_table <- read_csv(input_file)

#head(input_file)

stat_color_template <- c(
  "#F08030", # Attack
  "#6890F0", # Sp. Attack
  "#78C850"  # Sp. Defense
)
pokemon_table <- 
  pokemon_table %>% 
  mutate(Feature = factor(Feature, levels = c("Attack","Sp. Atk","Sp. Def")))

predictors_plot <- ggplot(pokemon_table, aes(fct_reorder(Feature, Importance, .desc=TRUE), Importance, 
                       fill = Feature)) +
  geom_bar(stat = "identity") + scale_fill_manual(values = stat_color_template) +
  labs(x = "Feature", title = "Top Predictors for Legendaries") +
  theme(legend.position = "none")

ggsave("DecisionTree_important_features_plot.png", predictors_plot, path = output_file)
