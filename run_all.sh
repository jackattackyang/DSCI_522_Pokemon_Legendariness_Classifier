python src/1_pokemonData.py "./data/Pokemon.csv" "./data/Pokemon_clean.csv"
Rscript src/2_pokemonEDA.R ./data/Pokemon_clean.csv ./results
python src/3_pokemonAnalysis.py "./data/Pokemon_clean.csv" "./results/DecisionTree_important_features"
Rscript -e "rmarkdown::render('./doc/Final_Report.Rmd')"
