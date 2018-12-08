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

#pokemon_data = read_csv("../data/Pokemon_clean.csv")
pokemon_data = read_csv(input_file)

main <- function(){
  
  # converts data to tidy form
  pokemon_data_tidy <- pokemon_data %>% 
    gather(key="Feature", value="Points", HP:Speed)
  
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
  ggsave("EDA_pokemonFeatureComparison.png", pokemon_feature_comparison,
         path=output_file)
  
  pkmn_type_colors <- c(
    '#78C850',  ## Grass
    '#F08030',  ## Fire
    '#6890F0',  ## Water
    '#A8B820',  ## Bug
    '#A8A878',  ## Normal
    '#A040A0',  ## Poison
    '#F8D030',  ## Electric
    '#E0C068',  ## Ground
    '#EE99AC',  ## Fairy
    '#C03028',  ## Fighting
    '#F85888',  ## Psychic
    '#B8A038',  ## Rock
    '#705898',  ## Ghost
    '#98D8D8',  ## Ice
    '#7038F8',  ## Dragon
    '#705848',  ## Dark
    '#B8B8D0',  ## Steel  
    "#A890F0"   ## Flying
  )
  
  # facet barplot comparing type effects on legendaries, color coded :)
  pokemon_type_comparison <- 
    pokemon_data_tidy %>% 
    mutate(`Type 1` = factor(`Type 1`, levels=c("Grass","Fire","Water","Bug","Normal","Poison",
                                                "Electric","Ground","Fairy","Fighting","Psychic",
                                                "Rock","Ghost","Ice","Dragon","Dark","Steel",
                                                "Flying"))) %>% 
    group_by(`Type 1`) %>% 
    mutate(count = n()) %>% 
    ggplot(aes(x = `Type 1`,  fill = `Type 1`)) +
    geom_bar(position = "dodge") + 
    scale_fill_manual(values = pkmn_type_colors) + 
    facet_grid(Legendary ~ ., 
               labeller = labeller(Legendary = c(False = "Non-Legendary", True = "Legendary"))) +
    coord_flip() + theme(legend.position = "none") +
    labs(title = "Pokemon Type Comparison", y = "Count")
  
  ggsave("EDA_pokemonTypeComparison.png", pokemon_type_comparison, path=output_file)
  
}

main()
