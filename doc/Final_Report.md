Pokemon Legendariness Classifier
================
Rayce Rossum, Jack Yang

Intro
-----

### Proposal Question

We are interested in what are the top strongest indicators that determines whether a Pokemon is legendary.
This question is **Predictive** as we are using existing Pokemon data to assess the attributes that are most indicative of a legendary Pokemon

### Procedure

#### Data Retrieval

<<<<<<< HEAD
We used the following python script to retrieve the [Pokemon Dataset](https://www.kaggle.com/abcsds/pokemon) from Kaggle

#### Data Cleaning

We dropped "Generation" and "Total"

#### Exploratory Data Analysis

The following barplot explores the dataset and gives us some intuition of what proportion of Pokemon is actually legendary.
<img src="C:/Users/Jack/Documents/Data Science/DSCI522_workflows/DSCI_522_Pokemon_Legendariness_Classifier/results/EDA_pokemonCount.png" alt="Figure 1: Pokemon Count" width="80%" />
<p class="caption">
Figure 1: Pokemon Count
</p>

We are most curious in determining whether there is a relationship between Pokemon attributes and the legendary status.

Lastly, we also want to see whether there is favoritism for legendary Pokemon across different types.

#### Analysis

We used the decision tree classifier in Python's sklearn. We fed in stats of Pokemon including: type, attack, health... etc. as features. After fitting the data, object attribute feature\_importances\_ returned an array of the gini score reduction of each feature. The top features with the highest values answer our question.

#### Results

From our analysis, we found "Sp. Atk", "Attack", "Speed" and "HP" to have the greatest impact on determining the legendary status of Pokemon. Types, as it turned out, have very little influence.

These top attributes, however, are greatly dependent on the set random state. After many iterations, we found "Sp. Atk" and "Attack" to consistently have high importance.

#### Limitations and Time Considerations

With our current knowledge level, between decision trees and KNN, we were more comfortable with classifying categorical and numerical variables using decision trees. However, we cannot say whether decision trees is better than KNN. A problem we encountered using decision trees is that it is dependent on random states for tie breaking. It is difficult to conclusively state the exact combination of top predictors as they vary at times. KNN does not have this error. These two may also not be the best method for our question. Our views may change in a few weeks from now with more techniques learned in 571.

Another limitation with this analysis is the psedo-legendaries where Pokemon with high stats are still considered non-legendary. So in this case, our classifier would wrongly classify a normal Pokemon as a legendary, eg.

With more time avilable, we would test likely mis-classifications such as the case mentioned above to better fine tune our classifier.
=======
We downloaded the Pokemon dataset from from
[Kaggle](https://www.kaggle.com/abcsds/pokemon) and used the respective
read csv calls from R and Python.

#### Data Cleaning

We dropped “Generation” and “Total” from our set of features. “Total”
was dropped as it was not an independent variables, it was in fact fully
dependent on all of the other stat variables, therefore it made no
significant difference to our results. “Generation” was dropped as
number of legendaries varies between generations and we did not want the
generation to influence our decision tree.

#### Exploratory Data Analysis

The following barplot explores the dataset and gives us some intuition
of what proportion of Pokemon is actually legendary.

We are most curious in determining whether there is a relationship
between Pokemon attributes and the legendary status.

Lastly, we also want to see whether there is favoritism for legendary
Pokemon across different types.

#### Analysis

We used the decision tree classifier in Python’s sklearn. We split our
data into a features set that included stats and type of Pokemon, and a
target set that included the Pokemon’s legendary status. A train and
test set were created and a `DecisionTreeClassifier` was then used to
generate our model. We optimized our hyper parameter (depth) by cross
validation on our test set. After fitting the data, the object attribute
`feature_importances_` returned an array of the gini score reduction of
each feature. The top features with the highest values answer our
question.

#### Results

From our analysis, we found “Sp. Atk”, “Attack”, “Speed” and “HP” to
have the greatest impact on determining the legendary status of Pokemon.
Types, as it turned out, have very little influence.

These top attributes, however, are greatly dependent on the set random
state. After many iterations, we found “Sp. Atk” and “Attack” to
consistently have high
importance.

``` r
important_features = read_csv(here::here("results", "DecisionTree_important_features.csv"))
```

    ## Warning: Missing column names filled in: 'X1' [1]

    ## Parsed with column specification:
    ## cols(
    ##   X1 = col_integer(),
    ##   Feature = col_character(),
    ##   Importance = col_double()
    ## )

``` r
knitr::kable(important_features)
```

| X1 | Feature         | Importance |
| -: | :-------------- | ---------: |
|  3 | Sp. Atk         |  0.3403565 |
|  1 | Attack          |  0.1714065 |
|  5 | Speed           |  0.1354356 |
|  0 | HP              |  0.1345492 |
|  2 | Defense         |  0.0441327 |
| 20 | Type 1\_Psychic |  0.0372505 |
|  4 | Sp. Def         |  0.0258732 |
| 41 | Type 2\_Water   |  0.0208191 |
| 28 | Type 2\_Fairy   |  0.0195573 |
| 23 | Type 1\_Water   |  0.0191334 |
| 33 | Type 2\_Grass   |  0.0177668 |
| 31 | Type 2\_Flying  |  0.0161180 |
| 35 | Type 2\_Ice     |  0.0161180 |

#### Limitations and Time Considerations

With our current knowledge level, between decision trees and KNN, we
were more comfortable with classifying categorical and numerical
variables using decision trees. However, we cannot say whether decision
trees is better than KNN. A problem we encountered using decision trees
is that it is dependent on random states for tie breaking. It is
difficult to conclusively state the exact combination of top predictors
as they vary at times. KNN does not have this error. These two may also
not be the best method for our question. Our views may change in a few
weeks from now with more techniques learned in 571.

An interesting insight that we did not make use of in our analysis is
the fact that many legendary Pokemon are classified as “Genderless”,
therefore if we were to add another feature to our dataset, it may give
us another good indicator.

Another limitation with this analysis is the “pseudo-legendary”, a
Pokemon with high stats that is not considered legendary. So in this
case, our classifier would wrongly classify a normal Pokemon as a
legendary.

With more time avilable, we would test likely mis-classifications, add a
“Gender” feature and attempt to improve the score of our model by
identifying better features.
>>>>>>> 56390065564ac21c0b2c7a7509de89e5461ffaaa
