# Pokemon Legendariness Classifier

##### Collaborators:

|Name|github.com|
|----|----------|
|Rayce Rossum|[RayceRossum](https://github.com/RayceRossum) |
|Jack Yang| [jackattackyang](https://github.com/jackattackyang) |

### Report
Report can be found [here]("docs/Final_Report.md")

### Usage

1. Clone this Repo
2. Run the following commands from the shell:
```
python src/1_pokemonData.py "./data/Pokemon.csv" "./data/Pokemon_clean.csv"
Rscript src/2_pokemonEDA.R ./data/Pokemon_clean.csv ./results
python src/3_pokemonAnalysis.py "./data/Pokemon_clean.csv" "./results"
Rscript src/4_predictorsPlot.R ./results/DecisionTree_important_features.csv ./results
Rscript -e "rmarkdown::render('./doc/Final_Report.Rmd')"
```
<br> alternatively run `run_all.sh` or `Makefile`

### Dependencies

- R libraries
  - rmarkdown
  - knitr
  - tidyverse
  - maps
  - here

- Python libraries
  - matplotlib
  - numpy
  - seaborn
  - pandas
  - argparse
  - sklearn
