python src/pokemonData.py "./data/Pokemon.csv" "./data/Pokemon_clean.csv"
Rscript src/pokemonEDA.R ./data/Pokemon_clean.csv ./results
python src/pokemonAnalysis.py "./data/Pokemon_clean.csv" "./results/DecisionTree_important_features.png"
