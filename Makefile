all: doc/Final_Report.md

# cleans oringal csv
data/Pokemon_clean.csv: data/Pokemon.csv src/1_pokemonData.py
	python src/1_pokemonData.py "./data/Pokemon.csv" "./data/Pokemon_clean.csv"

# performs EDA script and generates 3 plots
results/EDA_pokemonCount.png results/EDA_pokemonFeatureComparison.png results/EDA_pokemonTypeComparison.png: data/Pokemon_clean.csv src/2_pokemonEDA.R
	Rscript src/2_pokemonEDA.R ./data/Pokemon_clean.csv ./results

# generates a table of feature importances and the cross val plot
results/DecisionTree_important_features.csv results/cross_val_plot.png: data/Pokemon_clean.csv src/3_pokemonAnalysis.py
	python src/3_pokemonAnalysis.py "./data/Pokemon_clean.csv" "./results"

# generates and replaces the same feature importances but nicer looking
results/DecisionTree_important_features_plot.png: results/DecisionTree_important_features.csv src/4_predictorsPlot.R
	Rscript src/4_predictorsPlot.R ./results/DecisionTree_important_features.csv ./results

# generates final report
doc/Final_Report.md: doc/Final_Report.Rmd results/DecisionTree_important_features_plot.png results/EDA_pokemonCount.png results/EDA_pokemonFeatureComparison.png results/EDA_pokemonTypeComparison.png results/cross_val_plot.png
	Rscript -e "rmarkdown::render('./doc/Final_Report.Rmd')"

clean:
	# cleans csv file
	rm -f data/Pokemon_clean.csv

	# cleans the 3 EDA plots
	rm -f results/EDA_pokemonCount.png
	rm -f results/EDA_pokemonFeatureComparison.png
	rm -f results/EDA_pokemonTypeComparison.png

	# cleans the features csv and cross val plot
	rm -f results/DecisionTree_important_features.csv
	rm -f results/cross_val_plot.png

	# cleans the R features plot
	rm -f results/DecisionTree_important_features_plot.png

	# cleans the md and html versions of the final report
	rm -f doc/Final_Report.md
	rm -f doc/Final_Report.html
