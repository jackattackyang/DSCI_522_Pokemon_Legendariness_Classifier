import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import argparse
from sklearn.tree import DecisionTreeClassifier, export_graphviz

def get_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('file_path', help='Data file path')
    parser.add_argument('output_file_path', help='Output file path')
    args = parser.parse_args()

    return args.file_path, args.output_file_path

def main():
    pokemon_data_file_path, pokemon_data_output_file_path = get_args()

    pokemon_data = pd.read_csv(pokemon_data_file_path)
    pokemon_data = pd.get_dummies(pokemon_data, columns=["Type 1", "Type 2"])

    features = pokemon_data.loc[:, "Total":"Type 2_Water"]
    features = features.drop(["Legendary", "Generation"], axis=1);

    legendary = pokemon_data.Legendary
    tree = DecisionTreeClassifier()
    tree.fit(features, legendary)
    feature_importances = tree.feature_importances_
    importance_table = pd.DataFrame({"Feature": features.columns.values, "Importance": feature_importances})
    importance_table = importance_table.query("Importance > 0.01")
    importance_table = importance_table.sort_values(by="Importance", ascending=False)

    plt.rcParams["figure.figsize"] = (15, 4)
    plt.rcParams["xtick.labelsize"] = 10
    importance_plot = sns.barplot(data=importance_table, x="Feature", y="Importance")

    importance_plot_fig = importance_plot.get_figure()
    importance_plot_fig.savefig(pokemon_data_output_file_path)


if __name__ == "__main__":
    main()
