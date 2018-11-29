all: doc/Final_Report.md

data/Pokemon_clean.csv: data/Pokemon.csv src/1_pokemonData.py
	python src/1_pokemonData.py "./data/Pokemon.csv" "./data/Pokemon_clean.csv"

results/EDA_pokemonCount.png results/EDA_pokemonFeatureComparison.png results/EDA_pokemonTypeComparison.png: data/Pokemon_clean.csv src/2_pokemonEDA.R
	Rscript src/2_pokemonEDA.R ./data/Pokemon_clean.csv ./results

results/DecisionTree_important_features.csv: data/Pokemon_clean.csv src/3_pokemonAnalysis.py
	python src/3_pokemonAnalysis.py "./data/Pokemon_clean.csv" "./results/DecisionTree_important_features"

results/DecisionTree_important_features_plot.png: results/DecisionTree_important_features.csv src/4_predictorsPlot.R
	Rscript src/4_predictorsPlot.R ./results/DecisionTree_important_features.csv ./results

doc/Final_Report.md: doc/Final_Report.Rmd results/DecisionTree_important_features_plot.png results/EDA_pokemonCount.png results/EDA_pokemonFeatureComparison.png results/EDA_pokemonTypeComparison.png
	Rscript -e "rmarkdown::render('./doc/Final_Report.Rmd')"

clean:
	# Script 1
	rm -f data/Pokemon_clean.csv

	# Script 2
	rm -f results/EDA_pokemonCount.png
	rm -f results/EDA_pokemonFeatureComparison.png
	rm -f results/EDA_pokemonTypeComparison.png

	# Script 3
	rm -f results/DecisionTree_important_features.csv

	# Script 4
	rm -f results/DecisionTree_important_features_plot.png

	# Script 5
	rm -f /doc/Final_Report.Rmd
