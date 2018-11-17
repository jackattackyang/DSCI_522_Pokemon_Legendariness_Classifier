# DSCI_522_Pokemon_Legendariness_Classifier
A scikit-learn decision tree classifier for Pokemon based on their stats to predict whether or not they're a legendary.


1. Choose a public data set from the web that you are interested in to carry out a small data analysis. You may also use any data set we have previously worked with in MDS. Prove to us that you can load the data set into R or Python (this could be demonstrating by writing a script that downloads the data and saves a snippet of it, for example).

> * [Pokemon CSV](https://github.com/jackattackyang/DSCI_522_Pokemon_Legendariness_Classifier/blob/master/data/Pokemon.csv)
> * [Python Script](https://github.com/jackattackyang/DSCI_522_Pokemon_Legendariness_Classifier/blob/master/src/getPokemonData.py)
> * [Image of bash](https://github.com/jackattackyang/DSCI_522_Pokemon_Legendariness_Classifier/blob/master/imgs/loaded_dataset.png)

2. With that data set, identify a question you would like to ask from it that could be answered by some simple analysis and visualization (more on this below). State what kind of question it is (it should be one of the 6 types discussed in lecture 1).

> Question: what are the 3 strongest predictors that determines whether a Pokemon is legendary? <br />
This question is **Predictive** as we are using existing Pokemon data to assess the attributes that are most indicative of a legendary Pokemon.

3. Make a plan of how you will analyze the data (report an estimate and confidence intervals? hypothesis test? classification with a decision tree?). Choose something you know how to do (report an estimate and confidence intervals, a two-group hypothesis), or will learn how to do in the first week of block 3 (ANOVA, classification with a decision tree).

> We plan to use the decision tree classifier in Python's `sklearn`. We will feed in stats of Pokemon including: type, attack, health... etc. as features. After fitting the data, object attribute `feature_importances_` will return an array of the gini score reduction of each feature. The top 3 features with the highest values would be the answer to our question.

4. Suggest how you might summarize the data to show this as a table or a number, as well as how you might show this as a visualization.

> To display the relative importance between features, we can visualize the scores with a scatter plot or bar plot. An ordered table of values can also be included.
