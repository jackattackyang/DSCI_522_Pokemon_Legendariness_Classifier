# Pokemon Legendariness Classifier

##### Collaborators:

|Name|github.com|
|----|----------|
|Rayce Rossum|[RayceRossum](https://github.com/RayceRossum) |
|Jack Yang| [jackattackyang](https://github.com/jackattackyang) |

## Report
Report can be found [here](docs/Final_Report.md)

## Usage

1. Clone the [Repo](https://github.com/UBC-MDS/DSCI_522_Pokemon_Legendariness_Classifier)

2. ```docker pull raycer/dsci_522_pokemon_legendariness_classifier``` to retrieve the image

3. a. Run the following commands from the shell to generate outputs:
```
# docker run --rm -v "/path/to/project":"/project-dir/" dsci_522_pokemon_legendariness_classifier make -C "/project-dir/" all
```
b. Alternatively

```# docker run -it --rm -v "/path/to/project":"/project-dir/" dsci_522_pokemon_classifier /bin/bash```<br/>
```# cd project-dir```<br/>
```# make all```

4. Alternatively run `run_all.sh` or individually:
<br/>
```
python src/1_pokemonData.py "./data/Pokemon.csv" "./data/Pokemon_clean.csv"
Rscript src/2_pokemonEDA.R ./data/Pokemon_clean.csv ./results
python src/3_pokemonAnalysis.py "./data/Pokemon_clean.csv" "./results"
Rscript src/4_predictorsPlot.R ./results/DecisionTree_important_features.csv ./results
Rscript -e "rmarkdown::render('./doc/Final_Report.Rmd')"
```
5. To clean analysis:
```
docker run --rm -v "/path/to/project":"/project-dir/" dsci_522_pokemon_legendariness_classifier make -C "/project-dir/" clean
```


## Dependencies

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
