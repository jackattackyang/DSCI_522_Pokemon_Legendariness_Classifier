python src/1_pokemonData.py "./data/Pokemon.csv" "./data/Pokemon_clean.csv"
Rscript src/2_pokemonEDA.R ./data/Pokemon_clean.csv ./results
python src/3_pokemonAnalysis.py "./data/Pokemon_clean.csv" "./results"
Rscript src/4_predictorsPlot.R ./results/DecisionTree_important_features.csv ./results
Rscript -e "rmarkdown::render('./doc/Final_Report.Rmd')"
