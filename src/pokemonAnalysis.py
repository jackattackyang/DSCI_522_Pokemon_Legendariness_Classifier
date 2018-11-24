import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
%matplotlib inline
from sklearn.tree import DecisionTreeClassifier, export_graphviz

#import pokemonData
pokemon_data = pd.read_csv("./data/Pokemon_clean.csv")
pokemon_data = pd.get_dummies(pokemon_data, columns=["Type 1", "Type 2"])
pokemon_data.head()
def main():
    #pokemon_data = pokemonData.get_pokemon_data(True)
    features = pokemon_data.loc[:, "Total":"Type 2_Water"]
    features = features.drop(["Legendary", "Generation"], axis=1);

    legendary = pokemon_data.Legendary
    tree = DecisionTreeClassifier()
    tree.fit(features, legendary)
    feature_importances = tree.feature_importances_
    importance_table = pd.DataFrame({"Feature": features.columns.values, "Importance": feature_importances})
    importance_table
    importance_table = importance_table.query("Importance > 0.01")
    importance_table = importance_table.sort_values(by="Importance", ascending=False)
    importance_table
    plt.rcParams["figure.figsize"] = (15, 4)
    plt.rcParams["xtick.labelsize"] = 10
    importance_plot = sns.barplot(data=importance_table, x="Feature", y="Importance")


if __name__ == "__main__":
    main()
