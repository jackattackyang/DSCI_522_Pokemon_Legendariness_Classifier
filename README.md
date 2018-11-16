# DSCI_522_Pokemon_Legendariness_Classifier
A scikit-learn decision tree classifier for Pokemon based on their stats to predict whether or not they're a legendary.


1. Choose a public data set from the web that you are interested in to carry out a small data analysis. You may also use any data set we have previously worked with in MDS. Prove to us that you can load the data set into R or Python (this could be demonstrating by writing a script that downloads the data and saves a snippet of it, for example).

> * [Pokemon CSV](https://github.com/jackattackyang/DSCI_522_Pokemon_Legendariness_Classifier/blob/master/data/Pokemon.csv)
> * [Python Script](https://github.com/jackattackyang/DSCI_522_Pokemon_Legendariness_Classifier/blob/master/src/getPokemonData.py)
> * [Image of bash](https://github.com/jackattackyang/DSCI_522_Pokemon_Legendariness_Classifier/blob/master/imgs/loaded_dataset.png)

2. With that data set, identify a question you would like to ask from it that could be answered by some simple analysis and visualization (more on this below). State what kind of question it is (it should be one of the 6 types discussed in lecture 1).

> Question: what is/are the threshold(s) that determines whether a Pokemon is legendary or note? <br />
This question is **Exploratory** as we are looking for the threshold values and making discoveries as to what makes a legendary Pokemon.

> Alternative question (in case primary does not pan out): can we predict the legendary status from the latest Pokemon generation 6? <br />
> This question is **Predictive** as we are using Pokemon data to predict which Pokemons in the newest generation qualifies as legendary.

3. Make a plan of how you will analyze the data (report an estimate and confidence intervals? hypothesis test? classification with a decision tree?). Choose something you know how to do (report an estimate and confidence intervals, a two-group hypothesis), or will learn how to do in the first week of block 3 (ANOVA, classification with a decision tree).

> We plan to use the decision tree classifier in Python's `sklearn`. We will feed in stats of Pokemon including: type, attack, health... etc. as features. For the primary question, we anticipate Mike will get into how to actually determine the threshold values in the coming week. For the alternative question, we will use the first 5 generations as training data and the final generation as test data.

4. Suggest how you might summarize the data to show this as a table or a number, as well as how you might show this as a visualization.

> For the primary question, we will visualize the legendary threshold(s) as a table of values. For the alternative, we will report the accuracy score and a table of correctly and wrongly predicted Pokemon.
