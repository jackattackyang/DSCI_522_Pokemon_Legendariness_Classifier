# Jack Yang, Nov.21, 2018
# 
# This script performs an exploratory data analysis
# of pokemon data for DSCI522 Workflows Milestone1
#
# Usage: Rscript pokemonEDA.R ../data/Pokemon_clean.csv ../results

suppressPackageStartupMessages(library(tidyverse))

args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
output_file <- args[2]

pokemon_data = read_csv(input_file)


main <- function(){
  
# converts data to tidy form
pokemon_data_tidy <- pokemon_data %>% 
  gather(key="Feature", value="Points", Total:Speed)

# bar graph displaying pokemon vs legendary pokemon numbers
pokemon_count <- pokemon_data_tidy %>% 
  ggplot(aes(Legendary, fill=Legendary)) + 
  geom_bar(width=0.5) + labs(title="Pokemon Count", y="") + 
  theme(legend.position="none")
ggsave("EDA_pokemonCount.png", pokemon_count, path=output_file)


# boxplot comparing pokemon stats
pokemon_feature_comparison <- pokemon_data_tidy %>% 
  ggplot(aes(Feature, Points, fill=Legendary)) +
  geom_boxplot() + labs(title="Pokemon Feature Comparison") 
ggsave("EDA_pokemoneFeatureComparison.png", pokemon_feature_comparison,
       path=output_file)
}


main()