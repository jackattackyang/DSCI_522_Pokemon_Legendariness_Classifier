# plotting final graph for strongest predictors
# Usage: Rscript 4_predictorsPlot.R "../results/DecisionTree_important_features.csv" "../results"

suppressPackageStartupMessages(library(tidyverse))

args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
output_file <- args[2]

pokemon_table <- read_csv(input_file)
#pokemon_table <- read_csv("../results/DecisionTree_important_features.csv")

#head(input_file)

main <- function(){
    
  stat_color_template <- c(
    "#F08030", # Attack
    "#6890F0", # Sp. Attack
    "#78C850", # Sp. Defense
    "#F85888", # Speed
    "#F8D030", # Defense
    "#B8A038", # Rock
    "#FF0000"  # HP
  )
  pokemon_table <- 
    pokemon_table %>% 
    mutate(Feature = factor(Feature, levels = c("Attack","Sp. Atk","Sp. Def", "Speed", "Defense", "Type 1_Rock", "HP")))
  
  pokemon_table 
  
  (predictors_plot <- ggplot(pokemon_table, aes(fct_reorder(Feature, Importance, .desc=TRUE), Importance, 
                         fill = Feature)) +
    geom_bar(stat = "identity") + scale_fill_manual(values = stat_color_template) +
    labs(x = "", title = "Top Predictors for Legendaries",
         y = "Predictor %") +
    theme(legend.position = "none"))
  
  ggsave("DecisionTree_important_features_plot.png", predictors_plot, path = output_file, width = 5, height =5)

}

main()
