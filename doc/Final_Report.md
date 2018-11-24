Pokemon Legendariness Classifier
================
Rayce Rossum, Jack Yang

## Intro

### Proposal Question

We are interested in what are the top strongest indicators that
determines whether a Pokemon is legendary. This question is
**Predictive** as we are using existing Pokemon data to assess the
attributes that are most indicative of a legendary Pokemon

### Procedure

#### Data Retrieval

We downloaded the [Pokemon
Dataset](https://www.kaggle.com/abcsds/pokemon) from Kaggle and used the
respective read csv calls from R and Python.

#### Data Cleaning

We dropped “Generation” and “Total” from our set of features. “Total”
was dropped as it was not an independent variable, it was in fact fully
dependent on all of the other stat variables, therefore it made no
significant difference to our results. “Generation” was dropped as
number of legendaries varies between generations and we did not want the
generation to influence our decision tree.

#### Exploratory Data Analysis

The following barplot explores the dataset and gives us some intuition
of what proportion of Pokemon is actually
legendary.

<img src="/home/rayce/Assignments/Block 3/DSCI 522/DSCI_522_Pokemon_Legendariness_Classifier/results/EDA_pokemonCount.png" width="80%" />

Figure 1: Pokemon Count

Our EDA revealed that less than 10 percent of Pokemon are legendary.
This was a little more than expected. We then wanted to determine
whether there is a relationship between Pokemon attributes and legendary
status.

<img src="/home/rayce/Assignments/Block 3/DSCI 522/DSCI_522_Pokemon_Legendariness_Classifier/results/EDA_pokemonFeatureComparison.png" width="80%" />

Figure 2: Pokemon Feature Comparison

We saw that indeed, legendary Pokemon tend to have higher stats compared
to regular Pokemon. Lastly, we wanted to see whether there is any
favoritism for legendary Pokemon across different
types.

<img src="/home/rayce/Assignments/Block 3/DSCI 522/DSCI_522_Pokemon_Legendariness_Classifier/results/EDA_pokemonTypeComparison.png" width="80%" />

Figure 3: Pokemon Type Comparison

“Flying”, “Dragon” and “Psychic” types take up a disproportionate number
of all legendaries, given their representation. We would expect these
types to play a role as legendary predictors.

#### Analysis

We used the decision tree classifier in Python’s sklearn. We split our
data into a features set that included stats and type of Pokemon, and a
target set that included the Pokemon’s legendary status. Type attributes
(categorical variables) for the Pokemon were split into columns
containing dummy variables due to the shortcomings of the `sklearn`
implementation of decision trees. The `DecisionTreeClassifier` was then
used to generate our model. We optimized our hyper parameter (depth) by
conducting cross validation. After selecting the most optimal depth, we
refitted the entire dataset. The object attribute `feature_importances_`
returned an array of the gini score reduction of each feature. The
features with the highest values answer our question.

#### Results

From our analysis, we found “Sp. Atk”, “Attack”, “Sp. Def” to have the
greatest impact on determining the legendary status of Pokemon. Looking
back at our EDA we can see that “Sp. Atk” had a large difference between
non-legendary and legendary Pokemon so it makes sense that this was
chosen as an important feature. Types had no influence, which was
surprising based on our EDA.

| Feature | Importance |
| :------ | ---------: |
| Sp. Atk |  0.5316970 |
| Attack  |  0.3389105 |
| Sp. Def |  0.1293925 |

#### Limitations and Time Considerations

With our current knowledge level, between decision trees and KNN (k
nearest neighbors), we were more comfortable with classifying
categorical and numerical variables using decision trees. However, we
cannot say whether decision trees is better than KNN. These two may also
not be the best method for our question. Our views may change in a few
weeks from now with more techniques learned in 571. An interesting
insight that we did not make use of in our analysis is the fact that
many legendary Pokemon are classified as “Genderless”, therefore if we
were to add another feature to our dataset, it may give us another good
indicator. Another limitation with this analysis is the
“pseudo-legendary”, a Pokemon with high stats that is not considered
legendary. So in this case, our classifier would wrongly classify a
normal Pokemon as a legendary.

With more time available, we would test likely mis-classifications, add
a “Gender” feature and attempt to improve our model by by identifying
better features.
